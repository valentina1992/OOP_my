<!-- Main -->
<div id="main">
    <!-- Post -->
    <article class="post">
        <header>
            <div class="title">
                <h2><a href="#">Nuovo Libro </a></h2>
            </div>
        </header>
        <div class="centra fot">
            <label>
                <h2>Inserisci i dati del libro</h2>
            </label>
        </div>
        <!-- Search -->
        <!-- Links -->
        <form action="immagine" method="post" id="inserimento" enctype="multipart/form-data" >
            <div class="row">
                <div class="col-md-12 sinistra centra">
                    <img id="myImg" src="images/imgs.png" alt="your image" />
                    <label class="myFile">
                        <img class="upload" src="images/uploadd.png" alt="" />
                        <input type="file" name="photo"/>
                    </label>
                    <ul class="actions pagination centra sopra">
                        <li><input type="submit"  class="button big " value="Inserisci"></li>
                    </ul>
                </div>
                <div class="col-md-12 destra centra">

                    <div class="form-group fot">
                        <input type="text" class="form-control" name="id" id="id_opera" placeholder="ID">
                    </div>

                    <div class="form-group fot">
                        <input type="text" class="form-control" name="num_pag" id="num_pag" placeholder="Pagina">
                    </div>
                    </form>

                    <h2>Inserisci una Descrizione</h2>
                    <textarea  rows="4" cols="50" form="inserimento" name="descrizione"></textarea>
                    </ul>

                </div>  
            </div>

            </div>