const program = [];
let salle = "", jour = "", heure = "", groupe = "", enseignant = "";

function hideOccupiedSlots(){
    if (jour && heure){
        document.querySelectorAll(`[data-name="salle"]`).forEach(salle => {
            if (window.touteSeances.some(seance => seance.salle === salle.id && seance.jour === jour && seance.heure === heure) || 
                program.some(item => item.salle === salle.id && item.jour === jour && item.heure === heure)){
                salle.style.backgroundColor = "red";
                salle.onclick = null;
            }   
    });
}}

function resetSalleSlots(){
    document.querySelectorAll(`[data-name="salle"]`).forEach(salle => {
        if (salle.style.backgroundColor === "red"){
            salle.style.backgroundColor = "white";
            salle.onclick = (event) => setSalle(salle.id);
        }
    });
}

function setSalle (salleId){
    if (salle) document.querySelector(`[id="${salle}"][data-name="salle"]`).style.backgroundColor = "white";
    document.querySelector(`[id="${salleId}"][data-name="salle"]`).style.backgroundColor = "green";
    salle = salleId;
}

function setGroupe (groupeId){
    if (groupe) document.querySelector(`[data-name="groups"][id="`+ groupe + `"]`).style.backgroundColor = "#d1fae5";
    document.querySelector(`[data-name="groups"][id="`+ groupeId + `"]`).style.backgroundColor = "darkgreen";
    groupe = groupeId;
}

function setHeure (periode){
    if (heure) document.getElementById(heure).style.backgroundColor = "aqua";
    document.getElementById(periode).style.backgroundColor = "blue";
    heure = periode;
    resetSalleSlots();
    hideOccupiedSlots();
}

function setEnseignant(idEnseignant){
    enseignant = idEnseignant;
}

function setJour (journee){
    if (jour) document.getElementById(jour).style.backgroundColor = "#1e3a8a";
    document.getElementById(journee).style.backgroundColor = "darkblue";
    jour = journee;
    resetSalleSlots();
    hideOccupiedSlots();
}
const reset = ()=>{
    if (salle) document.querySelector(`[id="${salle}"][data-name="salle"]`).style.backgroundColor = "white";
    if (groupe) document.querySelector(`[data-name="groups"][id="`+ groupe + `"]`).style.backgroundColor = "#d1fae5";
    if (heure) document.getElementById(heure).style.backgroundColor = "aqua";
    if (jour) document.getElementById(jour).style.backgroundColor = "#1e3a8a";
    salle = "";
    jour = "";
    heure = "";
    groupe = "";
    enseignant = "";
}




const setProgram = ()=>{
    if (!salle || !jour || !heure || !groupe || !enseignant){
        alert("Veuillez remplir tous les champs (salle, jour, heure, groupe et enseignant)");
        return;
    }else if (program.some(item => 
        (item.salle === salle && item.jour === jour && item.heure === heure && item.groupe === groupe && item.enseignant === enseignant)||
        (item.enseignant === enseignant && item.heure === heure && item.jour === jour)||
        (item.salle === salle && item.heure === heure === item.jour === jour)
    )){ 
        alert("Ce créneau est déjà pris");
    }else if(window.touteSeances.some(item => 
        (item.salle === salle && item.jour === jour && item.heure === heure && item.groupe === groupe && item.enseignant === enseignant)||
        (item.enseignant === enseignant && item.heure === heure && item.jour === jour)||
        (item.salle === salle && item.heure === heure === item.jour === jour))){
        alert("Ce créneau existe déjà");
    }else {
        program.push({salle, jour, heure, groupe, enseignant});
        reset();
        alert("Programme ajouté avec succès");
    }
    
}


const saveProgram = async()=>{
    console.log(program);
    if (program.length != 0){
        let response = await fetch("/PlanifierCours", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(program)
        });
        let answer = await response.json();
        console.log(answer);
        program.length = 0;
        window.location.href = window.location.href;
    }
    else{
        alert("Aucun créneau n'a été ajouté au programme");
    }
}

