function switchLanguage(lang) {
    const currentUrl = new URL(window.location.href);
    const currentPath = currentUrl.pathname;

    let newPath;
    if (currentPath.includes('index')) {
        newPath = lang === 'fr' ? 'index.html' : `index_${lang}.html`;
    } else if (currentPath.includes('resume')) {
        newPath = lang === 'fr' ? 'resume.html' : `resume_${lang}.html`;
    } else if (currentPath.includes('about')) {
        newPath = lang === 'fr' ? 'about.html' : `about_${lang}.html`;
    } else {
        newPath = lang === 'fr' ? 'index.html' : `index_${lang}.html`; // Default to index page if no match
    }

    window.location.href = newPath;
}

function setInitialLanguage() {
    const userLang = navigator.language || navigator.userLanguage;
    const langCode = userLang.split('-')[0];
    const supportedLangs = ['en', 'fr', 'it'];
    const defaultLang = 'fr';

    let selectedLang = supportedLangs.includes(langCode) ? langCode : defaultLang;

    const currentUrl = new URL(window.location.href);
    const currentPath = currentUrl.pathname;

    const currentLang = supportedLangs.find(lang => lang === 'fr' ? !currentPath.includes('_en') && !currentPath.includes('_it') : currentPath.includes(`_${lang}`));
    if (!currentLang) {
        switchLanguage(selectedLang);
    } else {
        updateFlag(currentLang);
    }
}

function updateFlag(lang) {
    const flagSrc = {
        'en': 'en.svg',
        'fr': 'fr.svg',
        'it': 'it.svg'
    };
    document.getElementById('selected-lang-btn').innerHTML = `<img src="${flagSrc[lang]}" alt="${lang}" class="flag">`;
}

document.addEventListener("DOMContentLoaded", function() {
    setInitialLanguage();

    if (window.location.pathname.includes('resume')) {
        const lang = window.location.pathname.includes('_en') ? 'en' : (window.location.pathname.includes('_it') ? 'it' : 'fr');
        const xmlFile = lang === 'en' ? 'cv_en.xml' : (lang === 'it' ? 'cv_it.xml' : 'cv.xml');
        const xslFile = lang === 'en' ? 'cv_en.xsl' : (lang === 'it' ? 'cv_it.xsl' : 'cv.xsl');
        
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
