<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" />
    <xsl:template match="/">
        <div class="cv-container">
            <h2>
                <xsl:value-of select="CV/intitule/titre" />
            </h2>
            <p>
                <xsl:value-of select="CV/intitule/commentaire" />
            </p>
            <h3>État Civil</h3>
            <div class="section etat-civil">
                <p>
                    <strong>Nom :</strong>
                    <xsl:value-of select="CV/etat_civil/@nom" />
                </p>
                <p>
                    <strong>Prénom :</strong>
                    <xsl:value-of select="CV/etat_civil/@prenom" />
                </p>
                <p>
                    <strong>Date de naissance :</strong>
                    <xsl:value-of select="CV/etat_civil/@dateNaissance" />
                </p>
                <p>
                    <strong>Âge :</strong>
                    <xsl:value-of select="CV/etat_civil/@age" />
                </p>
                <p><strong>Adresse :</strong> <xsl:value-of select="CV/etat_civil/adresse/@numero" /> <xsl:value-of
                        select="CV/etat_civil/adresse/@rue" />, <xsl:value-of
                        select="CV/etat_civil/adresse/@ville" />, <xsl:value-of
                        select="CV/etat_civil/adresse/@cp" /></p>
                <p>
                    <strong>Téléphone :</strong>
                    <xsl:value-of select="CV/etat_civil/telephone" />
                </p>
                <p>
                    <strong>Email :</strong>
                    <xsl:value-of select="CV/etat_civil/email" />
                </p>
                <p><strong>Permis :</strong> <xsl:value-of select="CV/etat_civil/permis/@titulaire" />
        (Type: <xsl:value-of select="CV/etat_civil/permis/@type" />)</p>
            </div>
            <h3>Expérience Professionnelle</h3>
            <div class="section experience">
                <xsl:for-each select="CV/expPro/exp">
                    <div class="exp-item">
                        <p>
                            <strong>Poste :</strong>
                            <xsl:value-of select="poste" />
                        </p>
                        <p>
                            <strong>Entreprise :</strong>
                            <xsl:value-of select="entreprise" />
                        </p>
                        <p>
                            <strong>Description :</strong>
                            <xsl:value-of select="description" />
                        </p>
                        <p>
                            <strong>Date de début :</strong>
                            <xsl:value-of select="@dateDebut" />
                        </p>
                        <xsl:if test="@dateFin">
                            <p>
                                <strong>Date de fin :</strong>
                                <xsl:value-of select="@dateFin" />
                            </p>
                        </xsl:if>
                    </div>
                </xsl:for-each>
            </div>
            <h3>Formations</h3>
            <div class="section formations">
                <xsl:for-each select="CV/formations/formation">
                    <div class="formation-item">
                        <p>
                            <strong>Intitulé :</strong>
                            <xsl:value-of select="@intituleFormation" />
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
                            <xsl:value-of select="annee/@debut" />
                            <xsl:if test="annee/@fin"> - <strong>Année de fin :</strong> <xsl:value-of
                                    select="annee/@fin" /></xsl:if>
                        </p>
                        <p>
                            <strong>École :</strong>
                            <xsl:value-of select="ecole" />
                        </p>
                        <p>
                            <strong>Description :</strong>
                            <xsl:value-of select="description" />
                        </p>
                        <h4>Projets :</h4>
                        <xsl:for-each select="projets/projet">
                            <div>- <xsl:value-of select="." /></div>
                        </xsl:for-each>
                    </div>
                </xsl:for-each>
            </div>
            <h3>Compétences Informatiques</h3>
            <div class="section competences-info">
                <xsl:for-each select="CV/competencesInfo/intituleComp">
                    <div>
                        <strong><xsl:value-of select="@nom" /> :</strong>
                        <xsl:value-of select="@list" />
                    </div>
                </xsl:for-each>
            </div>
            <h3>Compétences Logiciels</h3>
            <div class="section competences-logiciel">
                <xsl:for-each select="CV/competencesLogiciel/intituleComp">
                    <div>
                        <strong><xsl:value-of select="@type" /> :</strong>
                        <xsl:value-of select="@list" />
                    </div>
                </xsl:for-each>
            </div>
            <h3>Langues</h3>
            <div class="section langues">
                <xsl:for-each select="CV/langues/langue">
                    <div>
                        <strong><xsl:value-of select="@lg" /> :</strong>
                        <xsl:value-of select="@niveau" />
                    </div>
                </xsl:for-each>
            </div>
            <h3>Centres d'intérêts</h3>
            <div class="section centre-dinterets">
                <xsl:for-each select="CV/centreDinterets/centreDinteret">
                    <div>- <xsl:value-of select="@nom" /></div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>