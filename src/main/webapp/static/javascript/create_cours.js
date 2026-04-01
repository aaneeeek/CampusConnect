let groupeCount = 0;

const addGroupe=()=>{{
    const groupeContainer = document.getElementById("groupes");
    groupeContainer.innerHTML += `
        <div class="input-div">
                <label>Nom de Groupe</label>
                <input type="text" name="nom_groupe_${groupeCount}" required>
            </div>
        <div class="input-div">
            <label>Capacité du Groupe</label>
            <input type="number" name="capacite_groupe_${groupeCount}" required>
        </div>
        <div class="input-div">
            <label>Volume Horraire</label>
            <input type="number" name="volume_horraire_${groupeCount}" required>
        </div>
    `;
    groupeCount += 1;
}

addGroupe();