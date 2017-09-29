<div class="container">
    <div class="row">
        <div class="col-md-6">
            <h2 style="margin-top:50px;">Modifica Utenti:</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Cognome</th>
                        <th>Email</th>
                        <th>Indirizzo</th>
                        <th>Professionre</th>
                        <th>Elimina</th>
                        <th>Promuovi</th>      
                        (clicca sul tipo di utente per promuovere)
                    </tr>
                </thead>
                <#if utente??>
                <#list utente as us>
                <tbody>
                    <tr>

                        <td>${us.nome}</td>
                        <td>${us.cognome}</td>
                        <td>${us.email}</td>
                        <td>${us.indirizzo}</td>
                        <td>${us.professione}</td>
                        <td style="background-color: rgba(255, 0, 0, 0.36);"><a href="elimina?utente=${us.email}">Elimina</a></td>
                        <td style="background-color: rgba(0, 0, 255, 0.3);"><a href="upgrade?utente=${us.email}&tipo=6">Amministratore</a></td>
                        <td style="background-color: rgba(0, 0, 255, 0.3);"><a href="upgrade?utente=${us.email}&tipo=5">Revisore Immagini</a></td>
                        <td style="background-color: rgba(0, 0, 255, 0.3);"><a href="upgrade?utente=${us.email}&tipo=4">Revisore Testo</a></td>
                        <td style="background-color: rgba(0, 0, 255, 0.3);"><a href="upgrade?utente=${us.email}&tipo=2">Scrittore</a></td>
                        <td style="background-color: rgba(0, 0, 255, 0.3);"><a href="upgrade?utente=${us.email}&tipo=3">Fotografo</a></td>
                        <td style="background-color: rgba(0, 0, 255, 0.3);"><a href="upgrade?utente=${us.email}&tipo=1">Utente</a></td>
                    </tr>
                </tbody>
                </#list>
                </#if>
            </table>
        </div>
    </div>



</div>

<!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
    <!-- The container for the modal slides -->
    <div class="slides"></div>
    <!-- Controls for the borderless lightbox -->
    <h3 class="title">Title</h3>
    <a class="prev">?</a>
    <a class="next">?</a>
    <a class="close">×</a>
    <!-- The modal dialog, which will be used to wrap the lightbox content -->
</div>