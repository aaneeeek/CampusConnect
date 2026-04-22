const program = [];
let salle = "", jour = "", heure = "", groupe = "";

function setSalle (salleId){
    if (salle) document.querySelector(`[id="${salle}"][data-name="salle"]`).style.backgroundColor = "bisque";
    document.querySelector(`[id="${salleId}"][data-name="salle"]`).style.backgroundColor = "green";
    salle = salleId;
}

function setGroupe (groupeId){
    if (groupe) document.querySelector(`[data-name="groups"][id="`+ groupe + `"]`).style.backgroundColor = "rgb(130, 213, 130)";
    document.querySelector(`[data-name="groups"][id="`+ groupeId + `"]`).style.backgroundColor = "darkgreen";
    groupe = groupeId;
}

function setHeure (periode){
    if (heure) document.getElementById(heure).style.backgroundColor = "aqua";
    document.getElementById(periode).style.backgroundColor = "blue";
    heure = periode;
}

function setJour (journee){
    if (jour) document.getElementById(jour).style.backgroundColor = "rgb(98, 136, 198)";
    document.getElementById(journee).style.backgroundColor = "darkblue";
    jour = journee;
}
const reset = ()=>{

}

const setProgram = ()=>{
    program.push({salle, jour, heure, groupe});
    salle = "";
    jour = "";
    heure = "";
    groupe = "";
}


const saveProgram = ()=>{
    fetch("/PlannifierCours", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(program)
    });
}

