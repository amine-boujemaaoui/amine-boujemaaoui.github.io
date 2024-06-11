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
            <h3>Stato Civile</h3>
            <div class="section stato-civile">
                <p>
                    <strong>Nome :</strong>
                    <xsl:value-of select="CV/etat_civil/@nom" />
                </p>
                <p>
                    <strong>Nome :</strong>
                    <xsl:value-of select="CV/etat_civil/@prenom" />
                </p>
                <p>
                    <strong>Data di nascita :</strong>
                    <xsl:value-of select="CV/etat_civil/@dateNaissance" />
                </p>
                <p>
                    <strong>Età :</strong>
                    <xsl:value-of select="CV/etat_civil/@age" />
                </p>
                <p><strong>Indirizzo :</strong> <xsl:value-of select="CV/etat_civil/adresse/@numero" /> <xsl:value-of
                        select="CV/etat_civil/adresse/@rue" />, <xsl:value-of
                        select="CV/etat_civil/adresse/@ville" />, <xsl:value-of
                        select="CV/etat_civil/adresse/@cp" /></p>
                <p>
                    <strong>Telefono :</strong>
                    <xsl:value-of select="CV/etat_civil/telephone" />
                </p>
                <p>
                    <strong>Email :</strong>
                    <xsl:value-of select="CV/etat_civil/email" />
                </p>
                <p><strong>Patente :</strong> <xsl:value-of select="CV/etat_civil/permis/@titulaire" />
        (Tipo: <xsl:value-of select="CV/etat_civil/permis/@type" />)</p>
            </div>
            <h3>Esperienza Professionale</h3>
            <div class="section esperienza">
                <xsl:for-each select="CV/expPro/exp">
                    <div class="exp-item">
                        <p>
                            <strong>Ruolo :</strong>
                            <xsl:value-of select="poste" />
                        </p>
                        <p>
                            <strong>Azienda :</strong>
                            <xsl:value-of select="entreprise" />
                        </p>
                        <p>
                            <strong>Descrizione :</strong>
                            <xsl:value-of select="description" />
                        </p>
                        <p>
                            <strong>Data di inizio :</strong>
                            <xsl:value-of select="@dateDebut" />
                        </p>
                        <xsl:if test="@dateFin">
                            <p>
                                <strong>Data di fine :</strong>
                                <xsl:value-of select="@dateFin" />
                            </p>
                        </xsl:if>
                    </div>
                </xsl:for-each>
            </div>
            <h3>Formazione</h3>
            <div class="section formazione">
                <xsl:for-each select="CV/formations/formation">
                    <div class="formazione-item">
                        <p>
                            <strong>Corso di studi :</strong>
                            <xsl:value-of select="@intituleFormation" />
                        </p>
                        <p>
                            <strong>Livello :</strong>
                            <xsl:value-of select="@niveau" />
                        </p>
                        <p>
                            <strong>Diploma :</strong>
                            <xsl:value-of select="@diplome" />
                        </p>
                        <p>
                            <strong>Campo :</strong>
                            <xsl:value-of select="@domaine" />
                        </p>
                        <p>
                            <strong>Anno di inizio :</strong>
                            <xsl:value-of select="annee/@debut" />
                            <xsl:if test="annee/@fin"> - <strong>Anno di fine :</strong> <xsl:value-of
                                    select="annee/@fin" /></xsl:if>
                        </p>
                        <p>
                            <strong>Scuola :</strong>
                            <xsl:value-of select="ecole" />
                        </p>
                        <p>
                            <strong>Descrizione :</strong>
                            <xsl:value-of select="description" />
                        </p>
                        <h4>Progetti :</h4>
                        <xsl:for-each select="projets/projet">
                            <div>- <xsl:value-of select="." /></div>
                        </xsl:for-each>
                    </div>
                </xsl:for-each>
            </div>
            <h3>Competenze Informatiche</h3>
            <div class="section competenze-info">
                <xsl:for-each select="CV/competencesInfo/intituleComp">
                    <div>
                        <strong><xsl:value-of select="@nom" /> :</strong>
                        <xsl:value-of select="@list" />
                    </div>
                </xsl:for-each>
            </div>
            <h3>Competenze Software</h3>
            <div class="section competenze-software">
                <xsl:for-each select="CV/competencesLogiciel/intituleComp">
                    <div>
                        <strong><xsl:value-of select="@type" /> :</strong>
                        <xsl:value-of select="@list" />
                    </div>
                </xsl:for-each>
            </div>
            <h3>Lingue</h3>
            <div class="section lingue">
                <xsl:for-each select="CV/langues/langue">
                    <div>
                        <strong><xsl:value-of select="@lg" /> :</strong>
                        <xsl:value-of select="@niveau" />
                    </div>
                </xsl:for-each>
            </div>
            <h3>Interessi</h3>
            <div class="section interessi">
                <xsl:for-each select="CV/centreDinterets/centreDinteret">
                    <div>- <xsl:value-of select="@nom" /></div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>