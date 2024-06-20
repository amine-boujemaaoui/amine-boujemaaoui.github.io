function switchLanguage(lang) {
    const currentUrl = new URL(window.location.href);
    const currentPath = currentUrl.pathname;

    let newPath;
    if (currentPath.includes('index')) {
        newPath = lang === 'fr' ? '/portfolio/index.html' : `/portfolio/${lang}/index.html`;
    } else if (currentPath.includes('resume')) {
        newPath = lang === 'fr' ? '/portfolio/resume.html' : `/portfolio/${lang}/resume.html`;
    } else {
        newPath = lang === 'fr' ? '/portfolio/index.html' : `/portfolio/${lang}/index.html`;
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
            return !currentPath.includes('en') && !currentPath.includes('ru');
        } else {
            return currentPath.includes(`${lang}`);
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
        'fr': 'img/fr.svg',
        'en': '../img/en.svg',
        'ru': '../img/ru.svg'
    };
    document.getElementById('selected-lang-btn').innerHTML = `<img src="${flagSrc[lang]}" alt="${lang}" class="flag">`;
}

document.addEventListener("DOMContentLoaded", function() {
    setInitialLanguage();

    if (window.location.pathname.includes('resume')) {
        const lang = window.location.pathname.includes('en') ? 'en' : (window.location.pathname.includes('ru') ? 'ru' : 'fr');

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

        fetch(xmlFile)
            .then(response => response.text())
            .then(xmlText => {
                const parser = new DOMParser();
                const xml = parser.parseFromString(xmlText, "application/xml");
                loadXSL(xslFile, xml);
            })
            .catch(error => console.error(`Failed to fetch XML file: ${error}`));
    }
});

function loadXSL(xslFile, xml) {
    fetch(xslFile)
        .then(response => response.text())
        .then(xslText => {
            const parser = new DOMParser();
            const xsl = parser.parseFromString(xslText, "application/xml");
            if (xsl) {
                const processor = new XSLTProcessor();
                processor.importStylesheet(xsl);
                const resultDocument = processor.transformToFragment(xml, document);
                document.getElementById("cv-content").appendChild(resultDocument);
            } else {
                console.error(`Failed to parse XSL file: ${xslFile}`);
            }
        })
        .catch(error => console.error(`Failed to fetch XSL file: ${error}`));
}
