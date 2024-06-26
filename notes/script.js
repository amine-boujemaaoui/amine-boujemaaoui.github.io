let subjects = [];
let ue = [];

function initialize() {
    const subjectsInput = document.getElementById('subjectsInput').value;
    const ueInput = document.getElementById('ueInput').value;
    
    try {
        subjects = JSON.parse(subjectsInput);
        ue = JSON.parse(ueInput);
        renderSubjects();
    } catch (error) {
        alert('Erreur de parsing JSON: ' + error.message);
    }
}

function renderSubjects() {
    const subjectsDiv = document.getElementById('subjects');
    subjectsDiv.innerHTML = '';
    let currentUeCode = '';

    subjects.forEach(subject => {
        if (subject.ue_code !== currentUeCode) {
            currentUeCode = subject.ue_code;
            const ueRow = document.createElement('tr');
            ueRow.className = 'ue-row';
            ueRow.id = `ue-${currentUeCode}`;
            ueRow.innerHTML = `<td colspan="5">UE ${currentUeCode}</td>`;
            subjectsDiv.appendChild(ueRow);
        }

        const row = document.createElement('tr');
        row.id = subject.code;
        row.innerHTML = `
            <td>${subject.code}</td>
            <td>${subject.title}</td>
            <td><input type="number" id="${subject.code}-partiel" step="1" inputmode="numeric"></td>
            <td><input type="number" id="${subject.code}-cctp" step="1" inputmode="numeric"></td>
            <td id="${subject.code}-average"></td>
        `;
        subjectsDiv.appendChild(row);
    });
}

function calculateSubjectAverage(subject, results) {
    const notation = subject.notation;
    const partiel = results[subject.code].partiel || 0;
    const cctp = results[subject.code].cctp || 0;
    const partiel_coef = notation.partiel_coef || 0;
    const cctp_coef = notation.cctp_coef || 0;
    
    const total_coef = partiel_coef + cctp_coef;
    if (total_coef === 0) return 0;
    
    return (partiel * partiel_coef + cctp * cctp_coef) / total_coef;
}

function calculateAverages() {
    const results = {};
    subjects.forEach(subject => {
        const partiel = parseFloat(document.getElementById(`${subject.code}-partiel`).value) || 0;
        const cctp = parseFloat(document.getElementById(`${subject.code}-cctp`).value) || 0;
        results[subject.code] = { partiel, cctp };
    });

    const ueResults = {};
    let overallTotal = 0;
    let overallCoef = 0;
    
    subjects.forEach(subject => {
        const ueCode = subject.ue_code;
        const subjectAverage = calculateSubjectAverage(subject, results);
        
        if (!ueResults[ueCode]) {
            ueResults[ueCode] = { total: 0, coef: 0, subjects: [], validated: true };
        }
        
        ueResults[ueCode].total += subjectAverage * subject.coef;
        ueResults[ueCode].coef += subject.coef;
        ueResults[ueCode].subjects.push({ code: subject.code, subjectAverage, validated: subjectAverage >= subject.note_minimal });
        
        if (subjectAverage < subject.note_minimal) {
            ueResults[ueCode].validated = false;
        }
        
        const averageCell = document.getElementById(`${subject.code}-average`);
        averageCell.textContent = subjectAverage.toFixed(2);
        const subjectRow = document.getElementById(subject.code);
        if (subjectAverage >= subject.note_minimal) {
            subjectRow.classList.add('validated');
            subjectRow.classList.remove('not-validated');
        } else {
            subjectRow.classList.add('not-validated');
            subjectRow.classList.remove('validated');
        }
    });
    
    for (const ueCode in ueResults) {
        const ueData = ueResults[ueCode];
        ueData.average = ueData.total / ueData.coef;
        overallTotal += ueData.total;
        overallCoef += ueData.coef;

        const ueRow = document.getElementById(`ue-${ueCode}`);
        if (ueData.validated) {
            ueRow.classList.add('ue-validated');
            ueRow.classList.remove('ue-not-validated');
        } else {
            ueRow.classList.add('ue-not-validated');
            ueRow.classList.remove('ue-validated');
        }
        
        ueRow.innerHTML = `<td colspan="5">UE ${ueCode} - Moyenne : ${ueData.average.toFixed(2)}</td>`;
    }
    
    const overallAverage = overallTotal / overallCoef;

    displayResults(overallAverage, overallAverage >= 10);
}

function displayResults(overallAverage, isOverallValidated) {
    const overallAverageDiv = document.getElementById('overallAverage');
    overallAverageDiv.innerHTML = `<h3>Moyenne Générale: ${overallAverage.toFixed(2)}</h3>`;
    if (isOverallValidated) {
        overallAverageDiv.classList.add('validated');
        overallAverageDiv.classList.remove('not-validated');
    } else {
        overallAverageDiv.classList.add('not-validated');
        overallAverageDiv.classList.remove('validated');
    }
}
