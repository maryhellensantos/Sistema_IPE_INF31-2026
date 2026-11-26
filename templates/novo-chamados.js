// ============================================================================
// NOVO CHAMADO - IPE
// - Mensagem diferenciada por perfil no 409 (CHAMADO_DUPLICADO)
// ============================================================================

document.addEventListener("DOMContentLoaded", async () => {
    await carregarTipos();
    await carregarPatrimonios();
    document.getElementById("form-novo-chamado")?.addEventListener("submit", enviarChamado);
});

async function carregarTipos() {
    const sel = document.getElementById("id_tipo_chamado");
    if (!sel) return;
    try {
        const res = await fetch("/api/tipos-chamado");
        const tipos = await res.json();
        sel.innerHTML = '<option value="">Selecione…</option>' +
            tipos.map(t => `<option value="${t.id_tipo_chamado}">${escapeHtml(t.nome)}</option>`).join("");
    } catch (e) {
        console.error("Erro ao carregar tipos:", e);
    }
}

async function carregarPatrimonios() {
    const sel = document.getElementById("id_patrimonio");
    if (!sel) return;
    try {
        const res = await fetch("/api/patrimonios");
        const lista = await res.json();
        sel.innerHTML = '<option value="">Selecione o bem…</option>' +
            lista.map(p =>
                `<option value="${p.id_patrimonio}">${escapeHtml(p.nome)} — Nº ${escapeHtml(p.numero_patrimonio)}</option>`
            ).join("");
    } catch (e) {
        console.error("Erro ao carregar patrimônios:", e);
    }
}

async function enviarChamado(e) {
    e.preventDefault();
    const form = e.currentTarget;
    const btn = form.querySelector('button[type="submit"]');
    const formData = new FormData(form);

    const idTipo = formData.get("id_tipo_chamado");
    const descricao = (formData.get("descricao_problema") || "").trim();
    const idPatrimonio = formData.get("id_patrimonio");

    if (!idTipo) return toast("Selecione o tipo de chamado.", "aviso");
    if (!descricao) return toast("Descreva o problema.", "aviso");
    if (!idPatrimonio) return toast("Selecione o patrimônio.", "aviso");

    btn.disabled = true;
    try {
        const res = await fetch("/api/novo-chamado", { method: "POST", body: formData });
        const data = await res.json().catch(() => ({}));

        if (res.ok) {
            toast(data.mensagem || "Chamado aberto com sucesso!", "sucesso");
            form.reset();
            setTimeout(() => { window.location.href = "chamados.html"; }, 1200);
            return;
        }

        if (res.status === 409 && data.codigo === "CHAMADO_DUPLICADO") {
            await tratarChamadoDuplicado(data);
            return;
        }

        toast(data.erro || "Erro ao abrir chamado.", "erro", 6000);
    } catch (err) {
        toast("Erro de conexão: " + err.message, "erro");
    } finally {
        btn.disabled = false;
    }
}

async function tratarChamadoDuplicado(data) {
    // Admin/Patrimônio → pode resolver, oferece ir para Chamados
    if (data.pode_resolver) {
        const ir = await confirmarAcao(
            `${data.erro}\n\nDeseja abrir a tela de Chamados para resolver agora?`,
            {
                titulo: "Chamado já existente",
                textoConfirmar: "Ir para Chamados",
                textoCancelar: "Fechar"
            }
        );
        if (ir) window.location.href = `chamados.html?chamado=${data.id_chamado_existente}`;
        return;
    }

    // Usuário padrão → só acompanha
    toast(data.erro, "info", 9000);
    const ver = await confirmarAcao(
        "Deseja ver o andamento do chamado existente?",
        {
            titulo: "Acompanhar chamado",
            textoConfirmar: "Ver chamado",
            textoCancelar: "Agora não"
        }
    );
    if (ver) window.location.href = `chamados.html?chamado=${data.id_chamado_existente}`;
}