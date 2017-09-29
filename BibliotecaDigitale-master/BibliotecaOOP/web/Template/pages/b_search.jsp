
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <center><h2 style="margin-top:100px;">Cerca Titoli</h2></center>
            <div id="custom-search-input">
                <div class="input-group col-md-12">
                    <form role="form" method="post">
                        <div class="col-md-6" >
                            <div class="form-group">
                                <label for="bedroom">Keyword</label>
                                <input type="text" class="form-control"  name="generic" placeholder="Enter keyword" style="height: 60px; font-size: 20px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" value="Search" class="btn btn-primary btn-block" style="height: 60px;margin-left: -14px;margin-top: 47px;width: 18%;" >
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <h2 style="margin-top:50px;">Risultato ricerca:</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Titolo</th>
                        <th>Autore</th>
                        <th>Pubblicazione</th>
                        <th>Link</th>
                    </tr>
                </thead>
                <#if book??>
                <#list book as libro>
                <tbody>
                    <tr>
                        <td>${libro.id}</td>
                        <td>${libro.titolo}</td>
                        <td>${libro.autore}</td>
                        <td>${libro.data_ins}</td>
                        <#if (admin gt 0)>
                        <th><a href="vai?pag=book&idopera=${libro.id}">vedi libro</a></th>
                        </#if>
                        </tr>
                </tbody>
                </#list>
                </#if>

            </table>
        </div>
    </div>



</div>

<a href="#works" class="gototop "><i class="fa fa-angle-up  fa-3x"></i></a>





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

