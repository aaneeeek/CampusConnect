const studentForm = `
        <div class="split">
            <div class="input-div">
                <label>Matricule</label>
                <input type="text" name="matricule" required>
            </div>
            <div class="input-div">
                <label>Filiere</label>
                <select name="filiere">
                    <option></option>
                    <option value="GIT">GIT</option>
                    <option value="GESI">GESI</option>
                    <option value="GQHSE">GQHSE</option>
                    <option value="GAM">GAM</option>
                </select>
            </div>
            <div class="input-div">
                <label>Niveau</label>
                <input type="number" name="niveau" required>
            </div>
        <div>
        <button class="form-button" type="submit">Créer Compte</button>
    `;
    const teacherForm = `
        <div class="split">
            <div class="input-div">
                <label>Statut</label>
                <select name="statut">
                    <option><option>
                    <option value="permanent">Permanent</option>
                    <option value="vacataire">Vacataire</option>
                </select>
            </div>
            <div class="input-div">
                <label>Department</label>
                <input type="text" name="departement">
            </div>
        <div>
        <button class="form-button" type="submit">Créer Compte</button>
    `;

const addInfo = ({value})=>{
    const container = document.getElementById("extra");
    if (value==="student"){
        container.innerHTML = studentForm;
    }
    else{
        container.innerHTML = teacherForm;
    }

}