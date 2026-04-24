<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Saisie des Notes</title>
  <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display&family=DM+Mono:wght@400;500&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet" />
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --bg:       #0f1117;
      --surface:  #181c27;
      --card:     #1e2333;
      --border:   #2c3350;
      --accent:   #4f7cff;
      --accent2:  #a78bfa;
      --danger:   #f87171;
      --success:  #34d399;
      --text:     #e2e8f0;
      --muted:    #64748b;
    }

    body {
      font-family: 'DM Sans', sans-serif;
      background: var(--bg);
      color: var(--text);
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 48px 16px 80px;
    }

    header {
      text-align: center;
      margin-bottom: 48px;
    }
    header .eyebrow {
      font-family: 'DM Mono', monospace;
      font-size: 11px;
      letter-spacing: .18em;
      text-transform: uppercase;
      color: var(--accent);
      margin-bottom: 12px;
    }
    header h1 {
      font-family: 'DM Serif Display', serif;
      font-size: clamp(28px, 5vw, 44px);
      background: linear-gradient(120deg, #fff 30%, var(--accent2));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      line-height: 1.15;
    }
    header p { margin-top: 10px; color: var(--muted); font-size: 14px; }

    .card {
      width: 100%;
      max-width: 860px;
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: 16px;
      overflow: hidden;
      box-shadow: 0 24px 64px rgba(0,0,0,.45);
    }

    .table-header {
      display: grid;
      grid-template-columns: 48px 1fr 1fr 1fr 56px;
      background: var(--surface);
      border-bottom: 1px solid var(--border);
      padding: 0 20px;
    }
    .table-header span {
      font-family: 'DM Mono', monospace;
      font-size: 10px;
      letter-spacing: .14em;
      text-transform: uppercase;
      color: var(--muted);
      padding: 14px 8px;
    }

    #rows-container { padding: 12px 20px; display: flex; flex-direction: column; gap: 8px; }

    .row {
      display: grid;
      grid-template-columns: 48px 1fr 1fr 1fr 56px;
      gap: 8px;
      align-items: center;
      animation: slideIn .2s ease forwards;
    }
    @keyframes slideIn {
      from { opacity: 0; transform: translateY(-6px); }
      to   { opacity: 1; transform: translateY(0); }
    }

    .row-num {
      font-family: 'DM Mono', monospace;
      font-size: 12px;
      color: var(--muted);
      text-align: center;
    }

    input {
      width: 100%;
      background: var(--surface);
      border: 1px solid var(--border);
      border-radius: 8px;
      padding: 10px 14px;
      font-family: 'DM Mono', monospace;
      font-size: 13px;
      color: var(--text);
      outline: none;
      transition: border-color .18s, box-shadow .18s, background .18s;
    }
    input::placeholder { color: var(--muted); }
    input:focus {
      border-color: var(--accent);
      box-shadow: 0 0 0 3px rgba(79,124,255,.18);
      background: #1a2038;
    }
    input.error {
      border-color: var(--danger);
      box-shadow: 0 0 0 3px rgba(248,113,113,.15);
    }
    input[type="number"]::-webkit-inner-spin-button { -webkit-appearance: none; }

    .btn-del {
      width: 36px; height: 36px;
      border: none; border-radius: 8px;
      background: transparent;
      color: var(--muted);
      cursor: pointer;
      display: flex; align-items: center; justify-content: center;
      transition: background .15s, color .15s;
      font-size: 18px;
      margin: auto;
    }
    .btn-del:hover { background: rgba(248,113,113,.12); color: var(--danger); }
    .btn-del:disabled { opacity: .25; cursor: not-allowed; }

    .card-footer {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 16px 20px;
      background: var(--surface);
      border-top: 1px solid var(--border);
      flex-wrap: wrap;
      gap: 12px;
    }

    .btn {
      display: inline-flex; align-items: center; gap: 8px;
      padding: 10px 20px;
      border-radius: 8px;
      border: none;
      font-family: 'DM Sans', sans-serif;
      font-size: 13px;
      font-weight: 600;
      cursor: pointer;
      transition: transform .12s, opacity .12s;
    }
    .btn:active { transform: scale(.97); }

    .btn-add {
      background: rgba(79,124,255,.12);
      color: var(--accent);
      border: 1px solid rgba(79,124,255,.3);
    }
    .btn-add:hover { background: rgba(79,124,255,.22); }

    .btn-submit {
      background: var(--accent);
      color: #fff;
      box-shadow: 0 4px 14px rgba(79,124,255,.35);
    }
    .btn-submit:hover { opacity: .88; }

    .btn-clear {
      background: transparent;
      color: var(--muted);
      border: 1px solid var(--border);
    }
    .btn-clear:hover { color: var(--danger); border-color: var(--danger); }

    .count-badge {
      font-family: 'DM Mono', monospace;
      font-size: 12px;
      color: var(--muted);
    }

    #toast {
      position: fixed; bottom: 28px; left: 50%; transform: translateX(-50%);
      background: var(--danger);
      color: #fff;
      font-weight: 600;
      font-size: 13px;
      padding: 12px 24px;
      border-radius: 999px;
      box-shadow: 0 8px 24px rgba(248,113,113,.35);
      opacity: 0; pointer-events: none;
      transition: opacity .25s, transform .25s;
      white-space: nowrap;
    }
    #toast.show { opacity: 1; transform: translateX(-50%) translateY(-4px); }

    @keyframes shake {
      0%,100% { transform: translateX(0); }
      20%      { transform: translateX(-6px); }
      40%      { transform: translateX(6px); }
      60%      { transform: translateX(-4px); }
      80%      { transform: translateX(4px); }
    }
  </style>
</head>
<body>

  <header>
    <div class="eyebrow">Gestion scolaire</div>
    <h1>Saisie des Notes</h1>
    <p>Remplissez une ligne par élève — ajoutez autant de lignes que nécessaire.</p>
  </header>

  <!-- action = URL de votre servlet | method = post -->
  <form id="noteForm" action="${pageContext.request.contextPath}/acceuilEnseignant" method="post">

    <div class="card">
      <div class="table-header">
        <span>#</span>
        <span>ID Groupe</span>
        <span>Matricule</span>
        <span>Note /20</span>
        <span></span>
      </div>

      <div id="rows-container"></div>

      <div class="card-footer">
        <div style="display:flex;gap:10px;flex-wrap:wrap">
          <!-- type="button" empêche la soumission accidentelle du formulaire -->
          <button type="button" class="btn btn-add" onclick="addRow()">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
              <line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/>
            </svg>
            Ajouter un élève
          </button>
          <button type="button" class="btn btn-clear" onclick="clearAll()">Tout effacer</button>
        </div>
        <div style="display:flex;align-items:center;gap:14px">
          <span class="count-badge" id="count-badge">1 élève</span>
         <a href="${pageContext.request.contextPath}/acceuilEtudiant?action=save"> <button type="button" class="btn btn-submit" onclick="submitForm()">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
              <polyline points="20 6 9 17 4 12"/>
            </svg>
            Enregistrer
          </button>
          </a>
        </div>
      </div>
    </div>

  </form>

  <div id="toast">Veuillez corriger les champs en rouge.</div>

<script>
  let rowCount = 0;

  function addRow() {
    rowCount++;
    const container = document.getElementById('rows-container');
    const row = document.createElement('div');
    row.className = 'row';

    /*
     * Les champs name[] permettent à la servlet de recevoir des tableaux :
     *   request.getParameterValues("idgroupe")  → String[]
     *   request.getParameterValues("matricule") → String[]
     *   request.getParameterValues("note")      → String[]
     * Les index sont garantis identiques car les tableaux sont construits
     * dans le même ordre côté HTML.
     */
    row.innerHTML = `
      <div class="row-num">${rowCount}</div>
      <input type="text"   name="id_groupe"  placeholder="ex: GRP-01"   autocomplete="off" />
      <input type="text"   name="matricule" placeholder="ex: 20240001" autocomplete="off" />
      <input type="number" name="note"      placeholder="0 – 20" min="0" max="20" step="0.25" autocomplete="off" />
      <button type="button" class="btn-del" onclick="removeRow(this)" title="Supprimer">×</button>
    `;

    container.appendChild(row);
    updateUI();
    row.querySelector('input').focus();
  }

  function removeRow(btn) {
    const row = btn.closest('.row');
    row.style.transition = 'opacity .15s';
    row.style.opacity = '0';
    setTimeout(() => { row.remove(); renumber(); updateUI(); }, 150);
  }

  function renumber() {
    document.querySelectorAll('.row').forEach((r, i) => {
      r.querySelector('.row-num').textContent = i + 1;
    });
  }

  function updateUI() {
    const rows = document.querySelectorAll('.row');
    const n = rows.length;
    document.getElementById('count-badge').textContent = `${n} élève${n > 1 ? 's' : ''}`;
    rows.forEach(r => r.querySelector('.btn-del').disabled = (n === 1));
  }

  function validate() {
    let valid = true;
    document.querySelectorAll('input').forEach(inp => inp.classList.remove('error'));

    document.querySelectorAll('.row').forEach(row => {
      const idg  = row.querySelector('[name="id_groupe"]');
      const mat  = row.querySelector('[name="matricule"]');
      const note = row.querySelector('[name="note"]');

      if (!idg.value.trim())  { idg.classList.add('error');  valid = false; }
      if (!mat.value.trim())  { mat.classList.add('error');  valid = false; }

      const n = parseFloat(note.value);
      if (note.value === '' || isNaN(n) || n < 0 || n > 20) {
        note.classList.add('error'); valid = false;
      }
    });
    return valid;
  }

  function submitForm() {
    if (!validate()) {
      const card = document.querySelector('.card');
      card.style.animation = 'none';
      card.offsetHeight; // reflow forcé
      card.style.animation = 'shake .35s ease';

      const toast = document.getElementById('toast');
      toast.classList.add('show');
      setTimeout(() => toast.classList.remove('show'), 2800);
      return;
    }

    // Tous les champs sont valides : soumettre le formulaire vers la servlet
    document.getElementById('noteForm').submit();
  }

  function clearAll() {
    if (!confirm('Effacer toutes les lignes ?')) return;
    document.getElementById('rows-container').innerHTML = '';
    rowCount = 0;
    addRow();
  }

  // Ctrl/Cmd + Entrée pour ajouter une ligne rapidement
  document.addEventListener('keydown', e => {
    if ((e.ctrlKey || e.metaKey) && e.key === 'Enter') addRow();
  });

  // Une ligne vide au chargement
  addRow();
</script>
</body>
</html>