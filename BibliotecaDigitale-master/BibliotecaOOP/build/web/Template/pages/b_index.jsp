<!-- works -->
<div id="works"  class=" clearfix grid">
    <figure class="effect-oscar  wowload fadeIn">
        <img src="images/portfolio/1.jpg" alt="img01"/>
        <figcaption>
            <h2>Cerca Titoli</h2>
            <p>E' possibile cercare un titolo<br>
                <a href="cerca">Esplora</a></p>
        </figcaption>
    </figure>
    <figure class="effect-oscar  wowload fadeInUp">
        <img src="images/portfolio/2.jpg" alt="img01"U>
        <figcaption>
            <h2>Modifica Utenti</h2>
            <p><br>                        
                <#if (admin == 1)>
                <a href="modifica">Modifica</a></p>
            </#if>
        </figcaption>

    </figure>
    <figure class="effect-oscar  wowload fadeInUp">
        <img src="images/portfolio/3.jpg" alt="img01"/>
        <figcaption>
            <h2>Upload</h2>
            <p><br>
                <#if (admin == 1)>
                <a href="immagine">Caricamento</a></p>
            </#if>
        </figcaption>
    </figure>
    <figure class="effect-oscar  wowload fadeInUp">
        <img src="images/portfolio/4.jpg" alt="img01"/>
        <figcaption>
            <h2>Controllo</h2>
            <p><br>
                <#if (admin gt 1)>

                <a href="cerca">Controlla</a></p>
            </#if>
        </figcaption>
    </figure>
    <figure class="effect-oscar  wowload fadeInUp">
        <img src="images/portfolio/5.jpg" alt="img01"/>
        <figcaption>
            <h2>Inserimento Libro</h2>
            <p><br>
                <#if (admin == 1)>

                <a href="opera">Controlla</a></p>
            </#if>
        </figcaption>
    </figure>
    <figure class="effect-oscar  wowload fadeInUp">
        <img src="images/portfolio/6.jpg" alt="img01"/>
        <figcaption>
            <h2>Edita Testo</h2>
            <p><br>
                <#if (admin == 1)>

                <a href="crea">Esplora</a></p>
            </#if>
        </figcaption>
    </figure>
</div>
<!-- works -->

<div id="partners" class="container spacer ">

    <!-- team -->
    <h3 class="text-center  wowload fadeInUp">Team</h3>
    <p class="text-center  wowload fadeInLeft">Biblioteca</p>
    <div class="row grid team  wowload fadeInUpBig">
        <div class=" col-sm-3 col-xs-6">
            <figure class="effect-chico">
                <img src="images/leonardo.png"/>
                <figcaption>
                    <p><b>Leonardo Ruggieri</b>
                        <br>Studente UNIVAQ<br><br>
                        <a href="https://www.facebook.com/leonardo.ruggeri1?fref=ts">
                            <i class="fa fa-facebook"></i>
                        </a>
                    </p>
                </figcaption>
            </figure>
        </div>

        <div class=" col-sm-3 col-xs-6">
            <figure class="effect-chico">
                <img src="images/vale.png"/>
                <figcaption>
                    <p><b>Valentina Di Cristofaro</b>
                        <br>Studentessa UNIVAQ<br><br>
                        <a href="https://www.facebook.com/vale.dicristofaro92">
                            <i class="fa fa-facebook"></i>
                        </a>
                    </p>
                </figcaption>
            </figure>
        </div>

        <div class=" col-sm-3 col-xs-6">
            <figure class="effect-chico">
                <img src="images/marco.png"/>
                <figcaption>
                    <p><b>Marco Bucci</b>
                        <br>Studente UNIVAQ<br><br>
                        <a href="https://www.facebook.com/marcoibra.bucci?fref=ts">
                            <i class="fa fa-facebook"></i>
                        </a>
                    </p>
                </figcaption>
            </figure>
        </div>
    </div>
    <!-- team -->

</div>