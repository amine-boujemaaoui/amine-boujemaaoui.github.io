function switchLanguage(lang) {
    const currentUrl = new URL(window.location.href);
    const currentPath = currentUrl.pathname;

    let newPath;
    if (currentPath.includes('index')) {
        newPath = lang === 'fr' ? '/portfolio/index.html' : `/portfolio/${lang}/index_${lang}.html`;
    } else if (currentPath.includes('resume')) {
        newPath = lang === 'fr' ? '/portfolio/resume.html' : `/portfolio/${lang}/resume_${lang}.html`;
    } else {
        newPath = lang === 'fr' ? '/portfolio/index.html' : `/portfolio/${lang}/index_${lang}.html`; // Default to index page if no match
    }

    window.location.href = newPath;
}

function setInitialLanguage() {
    const userLang = navigator.language || navigator.userLanguage;
    const langCode = userLang.split('-')[0];
    const supportedLangs = ['en', 'fr', 'ru'];
    const defaultLang = 'fr';

    let selectedLang = supportedLangs.includes(langCode) ? langCode : defaultLang;

    const currentUrl = new URL(window.location.href);
    const currentPath = currentUrl.pathname;

    const currentLang = supportedLangs.find(lang => {
        if (lang === 'fr') {
            return !currentPath.includes('_en') && !currentPath.includes('_ru');
        } else {
            return currentPath.includes(`_${lang}`);
        }
    });

    if (!currentLang) {
        switchLanguage(selectedLang);
    } else {
        updateFlag(currentLang);
    }
}

function updateFlag(lang) {
    const flagSrc = {
        'en': '../img/en.svg',
        'fr': 'img/fr.svg',
        'ru': '../img/ru.svg'
    };
    document.getElementById('selected-lang-btn').innerHTML = `<img src="${flagSrc[lang]}" alt="${lang}" class="flag">`;
}

document.addEventListener("DOMContentLoaded", function() {
    setInitialLanguage();

    if (window.location.pathname.includes('resume')) {
        const lang = window.location.pathname.includes('_en') ? 'en' : (window.location.pathname.includes('_ru') ? 'ru' : 'fr');
        
        const paths = {
            fr: {
                xml: 'xml/cv_fr.xml',
                xsl: 'xsl/cv_fr.xsl'
            },
            en: {
                xml: '../xml/cv_en.xml',
                xsl: '../xsl/cv_en.xsl'
            },
            ru: {
                xml: '../xml/cv_ru.xml',
                xsl: '../xsl/cv_ru.xsl'
            }
        };

        const xmlFile = paths[lang].xml;
        const xslFile = paths[lang].xsl;

        const xhttp = new XMLHttpRequest();
        xhttp.onload = function() {
            const xml = this.responseXML;
            loadXSL(xslFile, xml);
        };
        xhttp.open("GET", xmlFile, true);
        xhttp.send();
    }
});

function loadXSL(xslFile, xml) {
    const xhttpXSL = new XMLHttpRequest();
    xhttpXSL.onload = function() {
        const xsl = this.responseXML;
        if (xsl) {
            const processor = new XSLTProcessor();
            processor.importStylesheet(xsl);
            const resultDocument = processor.transformToFragment(xml, document);
            document.getElementById("cv-content").appendChild(resultDocument);
        } else {
            console.error(`Failed to load XSL file: ${xslFile}`);
        }
    };
    xhttpXSL.open("GET", xslFile, true);
    xhttpXSL.send();
}


function getXSL(xslFile) {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", xslFile, false);
    xhttp.send();
    return xhttp.status === 200 ? xhttp.responseXML : null;
}
