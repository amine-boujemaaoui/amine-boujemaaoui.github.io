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
            <h3>Личные данные</h3>
            <div class="section personal-info">
                <p>
                    <strong>Фамилия :</strong>
                    <span property="schema:familyName">
                        <xsl:value-of select="CV/etat_civil/@nom" />
                    </span>
                </p>
                <p>
                    <strong>Имя :</strong>
                    <span property="schema:givenName">
                        <xsl:value-of select="CV/etat_civil/@prenom" />
                    </span>
                </p>
                <p>
                    <strong>Дата рождения :</strong>
                    <span property="schema:birthDate">
                        <xsl:value-of select="CV/etat_civil/@dateNaissance" />
                    </span>
                </p>
                <p>
                    <strong>Возраст :</strong>
                    <xsl:value-of select="CV/etat_civil/@age" />
                </p>
                <p>
                    <strong>Адрес :</strong>
                    <span property="schema:address" typeof="schema:PostalAddress">
                        <xsl:value-of select="CV/etat_civil/adresse/@numero" />
                        <xsl:value-of
                            select="CV/etat_civil/adresse/@rue" />, <xsl:value-of
                            select="CV/etat_civil/adresse/@ville" />, <xsl:value-of
                            select="CV/etat_civil/adresse/@cp" />
                    </span>
                </p>
                <p>
                    <strong>Телефон :</strong>
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
                <p><strong>Водительские права :</strong> <xsl:value-of
                        select="CV/etat_civil/permis/@titulaire" /> (Тип: <xsl:value-of
                        select="CV/etat_civil/permis/@type" />)</p>
            </div>
            <h3>Профессиональный опыт</h3>
            <div class="section experience">
                <xsl:for-each select="CV/expPro/exp">
                    <div class="exp-item" typeof="schema:JobPosting">
                        <p>
                            <strong>Должность :</strong>
                            <span property="schema:title">
                                <xsl:value-of select="poste" />
                            </span>
                        </p>
                        <p>
                            <strong>Компания :</strong>
                            <span property="schema:hiringOrganization" typeof="schema:Organization">
                                <span property="schema:name">
                                    <xsl:value-of select="entreprise" />
                                </span>
                            </span>
                        </p>
                        <p>
                            <strong>Описание :</strong>
                            <span property="schema:description">
                                <xsl:value-of select="description" />
                            </span>
                        </p>
                        <p>
                            <strong>Дата начала :</strong>
                            <span property="schema:startDate">
                                <xsl:value-of select="@dateDebut" />
                            </span>
                        </p>
                        <xsl:if test="@dateFin">
                            <p>
                                <strong>Дата окончания :</strong>
                                <span property="schema:endDate">
                                    <xsl:value-of select="@dateFin" />
                                </span>
                            </p>
                        </xsl:if>
                    </div>
                </xsl:for-each>
            </div>
            <h3>Образование</h3>
            <div class="section education">
                <xsl:for-each select="CV/formations/formation">
                    <div class="education-item" typeof="schema:EducationalOccupationalCredential">
                        <p>
                            <strong>Название :</strong>
                            <span property="schema:educationalCredentialAwarded">
                                <xsl:value-of select="@intituleFormation" />
                            </span>
                        </p>
                        <p>
                            <strong>Уровень :</strong>
                            <xsl:value-of select="@niveau" />
                        </p>
                        <p>
                            <strong>Степень :</strong>
                            <xsl:value-of select="@diplome" />
                        </p>
                        <p>
                            <strong>Область :</strong>
                            <xsl:value-of select="@domaine" />
                        </p>
                        <p>
                            <strong>Год начала :</strong>
                            <span property="schema:startDate">
                                <xsl:value-of select="annee/@debut" />
                            </span>
                            <xsl:if test="annee/@fin"> - <strong>Год окончания :</strong> 
                                <span
                                    property="schema:endDate">
                                    <xsl:value-of select="annee/@fin" />
                                </span>
                            </xsl:if>
                        </p>
                        <p>
                            <strong>Школа :</strong>
                            <span property="schema:educationalInstitution">
                                <xsl:value-of select="ecole" />
                            </span>
                        </p>
                        <p>
                            <strong>Описание :</strong>
                            <span property="schema:description">
                                <xsl:value-of select="description" />
                            </span>
                        </p>
                        <h4>Проекты :</h4>
                        <xsl:for-each select="projets/projet">
                            <div>- <span property="schema:workExample">
                                    <xsl:value-of select="." />
                                </span></div>
                        </xsl:for-each>
                    </div>
                </xsl:for-each>
            </div>
            <h3>Компьютерные навыки</h3>
            <div class="section computer-skills">
                <xsl:for-each select="CV/competencesInfo/intituleComp">
                    <div>
                        <strong><span property="schema:skill">
                                <xsl:value-of select="@nom" />
                            </span> :</strong>
                        <xsl:value-of select="@list" />
                    </div>
                </xsl:for-each>
            </div>
            <h3>Навыки работы с программным обеспечением</h3>
            <div class="section software-skills">
                <xsl:for-each select="CV/competencesLogiciel/intituleComp">
                    <div>
                        <strong><span property="schema:skill">
                                <xsl:value-of select="@type" />
                            </span> :</strong>
                        <xsl:value-of select="@list" />
                    </div>
                </xsl:for-each>
            </div>
            <h3>Языки</h3>
            <div class="section languages">
                <xsl:for-each select="CV/langues/langue">
                    <div>
                        <strong><span property="schema:knowsLanguage">
                                <xsl:value-of select="@lg" />
                            </span> :</strong>
                        <xsl:value-of select="@niveau" />
                    </div>
                </xsl:for-each>
            </div>
            <h3>Интересы</h3>
            <div class="section interests">
                <xsl:for-each select="CV/centreDinterets/centreDinteret">
                    <div>- <span property="schema:hobby">
                            <xsl:value-of select="@nom" />
                        </span></div>
                </xsl:for-each>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>