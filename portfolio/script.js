function switchLanguage(lang) {
    const url = window.location.href;
    if (lang === 'en') {
        if (url.includes('index.html')) {
            window.location.href = 'index_en.html';
        } else if (url.includes('resume.html')) {
            window.location.href = 'resume_en.html';
        } else if (url.includes('about.html')) {
            window.location.href = 'about_en.html';
        }
    } else {
        if (url.includes('index_en.html')) {
            window.location.href = 'index.html';
        } else if (url.includes('resume_en.html')) {
            window.location.href = 'resume.html';
        } else if (url.includes('about_en.html')) {
            window.location.href = 'about.html';
        }
    }
}

document.addEventListener("DOMContentLoaded", function() {
    if (window.location.pathname.includes('resume')) {
        const lang = window.location.pathname.includes('_en') ? 'en' : 'fr';
        const xmlFile = lang === 'en' ? 'cv_en.xml' : 'cv.xml';
        const xslFile = lang === 'en' ? 'cv_en.xsl' : 'cv.xsl';
        
        const xhttp = new XMLHttpRequest();
        xhttp.onload = function() {
            const xml = this.responseXML;
            const xsl = getXSL(xslFile);
            const processor = new XSLTProcessor();
            processor.importStylesheet(xsl);
            const resultDocument = processor.transformToFragment(xml, document);
            document.getElementById("cv-content").appendChild(resultDocument);
        };
        xhttp.open("GET", xmlFile, true);
        xhttp.send();
    }
});

function getXSL(xslFile) {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", xslFile, false);
    xhttp.send();
    return xhttp.responseXML;
}
