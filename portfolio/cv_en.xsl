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
            <h3>Personal Information</h3>
            <div class="section personal-info">
                <p>
                    <strong>Name :</strong>
                    <xsl:value-of select="CV/etat_civil/@nom" />
                </p>
                <p>
                    <strong>First name :</strong>
                    <xsl:value-of select="CV/etat_civil/@prenom" />
                </p>
                <p>
                    <strong>Date of birth :</strong>
                    <xsl:value-of select="CV/etat_civil/@dateNaissance" />
                </p>
                <p>
                    <strong>Age :</strong>
                    <xsl:value-of select="CV/etat_civil/@age" />
                </p>
                <p>
                    <strong>Address :</strong> 
                    <xsl:value-of select="CV/etat_civil/adresse/@numero" />
                    <xsl:value-of select="CV/etat_civil/adresse/@rue" />, 
                    <xsl:value-of select="CV/etat_civil/adresse/@ville" />, 
                    <xsl:value-of select="CV/etat_civil/adresse/@cp" />
                </p>
                <p>
                    <strong>Phone :</strong>
                    <xsl:value-of select="CV/etat_civil/telephone" />
                </p>
                <p>
                    <strong>Email :</strong>
                    <xsl:value-of select="CV/etat_civil/email" />
                </p>
                <p><strong>Driving license :</strong> <xsl:value-of
                        select="CV/etat_civil/permis/@titulaire" /> (Type: <xsl:value-of
                        select="CV/etat_civil/permis/@type" />)</p>
            </div>
            <h3>Professional Experience</h3>
            <div class="section experience">
                <xsl:for-each select="CV/expPro/exp">
                    <div class="exp-item">
                        <p>
                            <strong>Position :</strong>
                            <xsl:value-of select="poste" />
                        </p>
                        <p>
                            <strong>Company :</strong>
                            <xsl:value-of select="entreprise" />
                        </p>
                        <p>
                            <strong>Description :</strong>
                            <xsl:value-of select="description" />
                        </p>
                        <p>
                            <strong>Start date :</strong>
                            <xsl:value-of select="@dateDebut" />
                        </p>
                        <xsl:if test="@dateFin">
                            <p>
                                <strong>End date :</strong>
                                <xsl:value-of select="@dateFin" />
                            </p>
                        </xsl:if>
                    </div>
                </xsl:for-each>
            </div>
            <h3>Education</h3>
            <div class="section education">
                <xsl:for-each select="CV/formations/formation">
                    <div class="education-item">
                        <p>
                            <strong>Title :</strong>
                            <xsl:value-of select="@intituleFormation" />
                        </p>
                        <p>
                            <strong>Level :</strong>
                            <xsl:value-of select="@niveau" />
                        </p>
                        <p>
                            <strong>Degree :</strong>
                            <xsl:value-of select="@diplome" />
                        </p>
                        <p>
                            <strong>Field :</strong>
                            <xsl:value-of select="@domaine" />
                        </p>
                        <p>
                            <strong>Start year :</strong>
                            <xsl:value-of select="annee/@debut" />
                            <xsl:if test="annee/@fin"> - <strong>End year :</strong> <xsl:value-of
                                    select="annee/@fin" /></xsl:if>
                        </p>
                        <p>
                            <strong>School :</strong>
                            <xsl:value-of select="ecole" />
                        </p>
                        <p>
                            <strong>Description :</strong>
                            <xsl:value-of select="description" />
                        </p>
                        <h4>Projects :</h4>
                        <xsl:for-each select="projets/projet">
                            <div>- <xsl:value-of select="." /></div>
                        </xsl:for-each>
                    </div>
                </xsl:for-each>
            </div>
            <h3>Computer Skills</h3>
            <div class="section computer-skills">
                <xsl:for-each select="CV/competencesInfo/intituleComp">
                    <div>
                        <strong><xsl:value-of select="@nom" /> :</strong>
                        <xsl:value-of select="@list" />
                    </div>
                </xsl:for-each>
            </div>
            <h3>Software Skills</h3>
            <div class="section software-skills">
                <xsl:for-each select="CV/competencesLogiciel/intituleComp">
                    <div>
                        <strong><xsl:value-of select="@type" /> :</strong>
                        <xsl:value-of select="@list" />
                    </div>
                </xsl:for-each>
            </div>
            <h3>Languages</h3>
            <div class="section languages">
                <xsl:for-each select="CV/langues/langue">
                    <div>
                        <strong><xsl:value-of select="@lg" /> :</strong>
                        <xsl:value-of select="@niveau" />
                    </div>
                </xsl:for-each>
            </div>
            <h3>Interests</h3>
            <div class="section interests">
                <xsl:for-each select="CV/centreDinterets/centreDinteret">
                    <div>- <xsl:value-of select="@nom" /></div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>