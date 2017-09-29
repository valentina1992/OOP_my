

<!-- begin:navbar -->

<!-- end:navbar -->

<!-- begin:content -->
<div id="content">
    <div class="container" style="margin-top: 50px;">
        <div class="row">
            <!-- begin:article -->
            <div class="col-md-12 ">
                <div class="row">
                    <div class="col-md-12 single-post">
                        <ul id="myTab" class="nav nav-tabs nav-justified">
                            <li class="active"><a href="#detail" data-toggle="tab"><h2>Immagini</h2></a></li>
                            <li><a href="#location" data-toggle="tab"><h2>Testo</h2></a></li>
                        </ul>

                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane fade in active" id="detail">
                                <div class="row">
                                    <div class="col-md-6">

                                        <div id="mioCarousel" class="carousel slide">
                                            <div class="carousel-inner mybox">
                                                <div class="item active" >
                                                    <h4>Titolo opera: ${idopera}</h4>
                                                </div>
                                                <#if immagini??>
                                                <#list immagini as immagine>

                                                <div class="item" >
                                                    <img src="${immagine.url_img}" style="max-width: 50%; max-height: 100%;">
                                                    <#if (admin == 5)>
                                                    <a href="accetta?a=accetta&id2=${immagine.id}&idopera=${immagine.id_opera}" class="button big" style="margin-left: 30%;">Upload</a>
                                                    <a href="accetta?a=rifiuta&id2=${immagine.id}&idopera=${immagine.id_opera}" class="button big">Rifiuta</a>
                                                    </#if>
                                                </div>
                                                </#list>
                                                </#if>

                                                <a class="left carousel-control" href="#mioCarousel" data-slide="prev">
                                                    <span class="icon-prev"></span>
                                                </a>
                                                <a class="right carousel-control" href="#mioCarousel" data-slide="next">
                                                    <span class="icon-next"></span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- break -->
                            </div>
                            <div class="tab-pane fade" id="location">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h3>Description</h3><br>
                                    </div>
                                    <div class="col-md-6">

                                        <div id="mioCarousel2" class="carousel slide">
                                            <div class="carousel-inner mybox">
                                                <div class="item active" >
                                                    <h4>Titolo opera: ${idopera}</h4>
                                                </div>
                                                <#if testo??>
                                                <#list testo as testi>

                                                <div class="item" >
                                                    <h4>${testi.titolo}</h4>
                                                    <p>${testi.paragrafo}</p> 
                                                    <#if (admin == 4)>

                                                    <a href="accettalibro?a=accetta&idcapitolo=${testi.id}&idopera=${testi.id_opera}" class="button big" style="margin-left: 30%;">Accetta</a>
                                                    <a href="accettalibro?a=rifiuta&idcapitolo=${testi.id}&idopera=${testi.id_opera}" class="button big" >Elimina</a>
                                                    </#if>
                                                </div>
                                                </#list>
                                                </#if>
                                                <a class="left carousel-control" href="#mioCarousel2" data-slide="prev">
                                                    <span class="icon-prev"></span>
                                                </a>
                                                <a class="right carousel-control" href="#mioCarousel2" data-slide="next">
                                                    <span class="icon-next"></span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end:content -->


