<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdfa="http://www.w3.org/ns/rdfa#">
    <xsl:output method="html" encoding="UTF-8" />
    <xsl:template match="/">
        <div class="cv-container" typeof="schema:Person">
            <h2 property="schema:headline">
                <xsl:value-of select="CV/intitule/titre" />
            </h2>
            <p property="schema:description">
                <xsl:value-of select="CV/intitule/commentaire" />
            </p>
            <h3>État Civil</h3>
            <div class="section etat-civil">
                <p>
                    <strong>Nom :</strong>
                    <span property="schema:familyName">
                        <xsl:value-of select="CV/etat_civil/@nom" />
                    </span>
                </p>
                <p>
                    <strong>Prénom :</strong>
                    <span property="schema:givenName">
                        <xsl:value-of select="CV/etat_civil/@prenom" />
                    </span>
                </p>
                <p>
                    <strong>Date de naissance :</strong>
                    <span property="schema:birthDate">
                        <xsl:value-of select="CV/etat_civil/@dateNaissance" />
                    </span>
                </p>
                <p>
                    <strong>Âge :</strong>
                    <xsl:value-of select="CV/etat_civil/@age" />
                </p>
                <p>
                    <strong>Adresse :</strong>
                    <span property="schema:address" typeof="schema:PostalAddress">
                        <span property="schema:streetAddress">
                            <xsl:value-of select="CV/etat_civil/adresse/@numero" />
                            <xsl:value-of select="CV/etat_civil/adresse/@rue" />
                        </span>
        ,
                        <span property="schema:addressLocality">
                            <xsl:value-of select="CV/etat_civil/adresse/@ville" />
                        </span>
        ,
                        <span property="schema:postalCode">
                            <xsl:value-of select="CV/etat_civil/adresse/@cp" />
                        </span>
                    </span>
                </p>
                <p>
                    <strong>Téléphone :</strong>
                    <span property="schema:telephone">
                        <xsl:value-of select="CV/etat_civil/telephone" />
                    </span>
                </p>
                <p>
                    <strong>Email :</strong>
                    <span property="schema:email">
                        <xsl:value-of select="CV/etat_civil/email" />
                    </span>
                </p>
                <p><strong>Permis :</strong> <xsl:value-of select="CV/etat_civil/permis/@titulaire" />
        (Type: <xsl:value-of select="CV/etat_civil/permis/@type" />)</p>
            </div>
            <h3>Expérience Professionnelle</h3>
            <div class="section experience">
                <xsl:for-each select="CV/expPro/exp">
                    <div class="exp-item" typeof="schema:JobPosting">
                        <p>
                            <strong>Poste :</strong>
                            <span property="schema:title">
                                <xsl:value-of select="poste" />
                            </span>
                        </p>
                        <p>
                            <strong>Entreprise :</strong>
                            <span property="schema:hiringOrganization" typeof="schema:Organization">
                                <span property="schema:name">
                                    <xsl:value-of select="entreprise" />
                                </span>
                            </span>
                        </p>
                        <p>
                            <strong>Description :</strong>
                            <span property="schema:description">
                                <xsl:value-of select="description" />
                            </span>
                        </p>
                        <p>
                            <strong>Date de début :</strong>
                            <span property="schema:startDate">
                                <xsl:value-of select="@dateDebut" />
                            </span>
                        </p>
                        <xsl:if test="@dateFin">
                            <p>
                                <strong>Date de fin :</strong>
                                <span property="schema:endDate">
                                    <xsl:value-of select="@dateFin" />
                                </span>
                            </p>
                        </xsl:if>
                    </div>
                </xsl:for-each>
            </div>
            <h3>Formations</h3>
            <div class="section formations">
                <xsl:for-each select="CV/formations/formation">
                    <div class="formation-item" typeof="schema:EducationalOccupationalCredential">
                        <p>
                            <strong>Intitulé :</strong>
                            <span property="schema:educationalCredentialAwarded">
                                <xsl:value-of select="@intituleFormation" />
                            </span>
                        </p>
                        <p>
                            <strong>Niveau :</strong>
                            <xsl:value-of select="@niveau" />
                        </p>
                        <p>
                            <strong>Diplôme :</strong>
                            <xsl:value-of select="@diplome" />
                        </p>
                        <p>
                            <strong>Domaine :</strong>
                            <xsl:value-of select="@domaine" />
                        </p>
                        <p>
                            <strong>Année de début :</strong>
                            <span property="schema:startDate">
                                <xsl:value-of select="annee/@debut" />
                            </span>
                            <xsl:if test="annee/@fin"> - <strong>Année de fin :</strong>
                                <span
                                    property="schema:endDate">
                                    <xsl:value-of select="annee/@fin" />
                                </span>
                            </xsl:if>
                        </p>
                        <p>
                            <strong>École :</strong>
                            <span property="schema:educationalInstitution">
                                <xsl:value-of select="ecole" />
                            </span>
                        </p>
                        <p>
                            <strong>Description :</strong>
                            <span property="schema:description">
                                <xsl:value-of select="description" />
                            </span>
                        </p>
                        <h4>Projets :</h4>
                        <xsl:for-each select="projets/projet">
                            <div>- <span property="schema:workExample">
                                    <xsl:value-of select="." />
                                </span></div>
                        </xsl:for-each>
                    </div>
                </xsl:for-each>
            </div>
            <h3>Compétences Informatiques</h3>
            <div class="section competences-info">
                <xsl:for-each select="CV/competencesInfo/intituleComp">
                    <div>
                        <strong><span property="schema:skill">
                                <xsl:value-of select="@nom" />
                            </span> :</strong>
                        <xsl:value-of select="@list" />
                    </div>
                </xsl:for-each>
            </div>
            <h3>Compétences Logiciels</h3>
            <div class="section competences-logiciel">
                <xsl:for-each select="CV/competencesLogiciel/intituleComp">
                    <div>
                        <strong><span property="schema:skill">
                                <xsl:value-of select="@type" />
                            </span> :</strong>
                        <xsl:value-of select="@list" />
                    </div>
                </xsl:for-each>
            </div>
            <h3>Langues</h3>
            <div class="section langues">
                <xsl:for-each select="CV/langues/langue">
                    <div>
                        <strong><span property="schema:knowsLanguage">
                                <xsl:value-of select="@lg" />
                            </span> :</strong>
                        <xsl:value-of select="@niveau" />
                    </div>
                </xsl:for-each>
            </div>
            <h3>Centres d'intérêts</h3>
            <div class="section centre-dinterets">
                <xsl:for-each select="CV/centreDinterets/centreDinteret">
                    <div>- <span property="schema:hobby">
                            <xsl:value-of select="@nom" />
                        </span></div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>