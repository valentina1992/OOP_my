<!-- Main -->
<div id="main">
    <!-- Post -->
    <article class="post">
        <header>
            <div class="title">
                <h2>${book.titolo}</h2>
            </div>
            <div class="meta">
                <time class="published" datetime="2015-11-01">${book.data_ins}</time>
                <h6><span class="name">${book.autore}</span></h6>
            </div>
        </header>

        <a href="${book.url_img}" class="image featured"><img class="dim" src="${book.url_img}" alt="" /></a>
        <div class="row">
            <div class="destra">
                <h4>ISBN: <label style="color:#b6b4b4;">${book.isbn}</label></h4>
                <h4>Editore: <label style="color:#b6b4b4;">${book.editore}</label></h4>
                <h4>Lingua: <label style="color:#b6b4b4;">${book.lingua}</label></h4>
            </div>
        </div>
        <hr align="left" size="1" width="100%" color="#b6b4b4" noshade>
        <article>
            <h2> Descrizione</h2>
            <header>
                <p>${book.descrizione}</p>
            </header>
        </article>

        </ul>
    </article>
</div>


