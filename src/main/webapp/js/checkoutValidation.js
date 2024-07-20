// Definizione dei pattern di validazione
const cardNumberPattern = /^\d{16}$/;
const cvvPattern = /^\d{3,4}$/; // American express usa CVV a 4 cifre
const namePattern = /^[A-Za-z\s]+$/;

// Messaggi di errore per i campi di input
const cardNumberErrorMessage = "Inserisci un numero di carta valido (16 cifre)";
const cvvErrorMessage = "Inserisci un CVV valido (3 o 4 cifre)";
const nameErrorMessage = "Il nome del titolare della carta può contenere solo lettere e spazi";
const addressErrorMessage = "L'indirizzo di spedizione è obbligatorio";

// Funzione principale di validazione del form
function validate() {
    let valid = true;
    let form = document.getElementById("checkoutForm");

    // Validazione Numero di Carta
    let spanCardNumber = document.getElementById("errorCardNumber");
    if (!validateFormElem(form.cardNumber, cardNumberPattern, spanCardNumber, cardNumberErrorMessage)) {
        valid = false;
    }

    // Validazione Data di Scadenza
    let spanDate = document.getElementById("errorDate");
    if (form.expiryDate.value === "") {
        form.expiryDate.classList.add("error");
        spanDate.innerHTML = "La data di scadenza è obbligatoria";
        spanDate.style.color = "red";
        valid = false;
    } else {
        form.expiryDate.classList.remove("error");
        spanDate.style.color = "black";
        spanDate.innerHTML = "";
    }

    // Validazione CVV
    let spanCVV = document.getElementById("errorCVV");
    if (!validateFormElem(form.cvv, cvvPattern, spanCVV, cvvErrorMessage)) {
        valid = false;
    }

    // Validazione Nome del Titolare della Carta
    let spanName = document.getElementById("errorName");
    if (!validateFormElem(form.cardHolderName, namePattern, spanName, nameErrorMessage)) {
        valid = false;
    }

    // Validazione Indirizzo di Spedizione
    let spanAddress = document.getElementById("errorIndirizzo");
    if (form.indirizzoSpedizione.value === "") {
        form.indirizzoSpedizione.classList.add("error");
        spanAddress.innerHTML = addressErrorMessage;
        spanAddress.style.color = "red";
        valid = false;
    } else {
        form.indirizzoSpedizione.classList.remove("error");
        spanAddress.style.color = "black";
        spanAddress.innerHTML = "";
    }

    return valid;
}

// Funzione di validazione per singolo elemento del form
function validateFormElem(formElem, pattern, span, message) {
    if (!formElem.value.match(pattern)) {
        formElem.classList.add("error");
        span.innerHTML = message;
        span.style.color = "red";
        return false;
    }
    formElem.classList.remove("error");
    span.style.color = "black";
    span.innerHTML = "";
    return true;
}

// Listener per l'evento di caricamento del documento
document.addEventListener("DOMContentLoaded", function() {
    // Listener per l'evento di submit del form
    document.getElementById("checkoutForm").addEventListener("submit", function(event) {
        // Validazione del form
        if (!validate()) {
            // Se la validazione fallisce, si impedisce l'invio del form
            event.preventDefault();
            // Aggiungi un messaggio globale se desideri informarli che ci sono errori
            alert("Per favore, correggi gli errori nel modulo prima di inviarlo.");
        }
    });
});
