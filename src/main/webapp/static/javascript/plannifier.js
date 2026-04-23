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
    if (program.some(item => item.salle === salle && item.jour === jour && item.heure === heure && item.groupe === groupe) || !salle || !jour || !heure || !groupe){ 
        alert("Ce créneau est déjà pris");
    } else {
        program.push({salle, jour, heure, groupe});
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

