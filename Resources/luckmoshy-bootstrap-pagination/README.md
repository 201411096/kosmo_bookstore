## bootstrap 4.1 pagnation

View live (  https://luckmoshy.github.io/luckmoshypagnation.js/)  .

Luckmoshy jQuery pagnation plugin provide simple yet fully customisable pagination. . 

### Luckmoshypagnation

Adding Pagination to your Website

<figure class="highlight"><pre><code class="language-html" data-lang="html"><span class="nt">&lt;nav</span> <span class="na">aria-label=</span><span class="s">"Page navigation example"</span><span class="nt">&gt;</span>
  <span class="nt">&lt;ul</span> <span class="na">class=</span><span class="s">"pagination"</span><span class="nt">&gt;</span>
    <span class="nt">&lt;li</span> <span class="na">class=</span><span class="s">"page-item"</span><span class="nt">&gt;&lt;a</span> <span class="na">class=</span><span class="s">"page-link"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;</span>Previous<span class="nt">&lt;/a&gt;&lt;/li&gt;</span>
    <span class="nt">&lt;li</span> <span class="na">class=</span><span class="s">"page-item"</span><span class="nt">&gt;&lt;a</span> <span class="na">class=</span><span class="s">"page-link"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;</span>1<span class="nt">&lt;/a&gt;&lt;/li&gt;</span>
    <span class="nt">&lt;li</span> <span class="na">class=</span><span class="s">"page-item"</span><span class="nt">&gt;&lt;a</span> <span class="na">class=</span><span class="s">"page-link"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;</span>2<span class="nt">&lt;/a&gt;&lt;/li&gt;</span>
    <span class="nt">&lt;li</span> <span class="na">class=</span><span class="s">"page-item"</span><span class="nt">&gt;&lt;a</span> <span class="na">class=</span><span class="s">"page-link"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;</span>3<span class="nt">&lt;/a&gt;&lt;/li&gt;</span>
    <span class="nt">&lt;li</span> <span class="na">class=</span><span class="s">"page-item"</span><span class="nt">&gt;&lt;a</span> <span class="na">class=</span><span class="s">"page-link"</span> <span class="na">href=</span><span class="s">"#"</span><span class="nt">&gt;</span>Next<span class="nt">&lt;/a&gt;&lt;/li&gt;</span>
  <span class="nt">&lt;/ul&gt;</span>
<span class="nt">&lt;/nav&gt;</span></code></pre></figure>
<br/>
#<p>Initilizing</p>

<figure><pre><code>
<script>
$(document).ready(function() {
$('#luckmoshy').luckmoshyPagination({
totalPages: 5,
// the current page that show on start
startPage: 1,

// maximum visible pages
visiblePages: 3,

initiateStartPageClick: true,

// template for pagination links
href: false,

// variable name in href template for page number
hrefVariable: '{{number}}',

// Text labels
first: 'First',
prev: 'Previous',
next: 'Next',
last: 'Last',

// carousel-style pagination
loop: false,

// callback function
onPageClick: function (event, page) {
   $('.page-active').removeClass('page-active');
  $('#container-pagnation'+page).addClass('page-active');
},

// pagination Classes
paginationClass: 'pagination',
nextClass: 'next',
prevClass: 'prev',
lastClass: 'last',
firstClass: 'first',
pageClass: 'page-item ',
activeClass: 'active',
disabledClass: 'disabled'

});
});



</script>
</code></pre></figure>
### 

<div class="col-md-6 order-md-1 text-center text-md-left pr-md-5">
        <h1 class="mb-3 bd-text-purple-bright">Bootstrap Pagnation</h1>
        <p class="lead">
Luckmoshy jQuery pagnation plugin  provide simple yet fully customisable pagination. </p>
        <p class="lead mb-4">
 <span class="s f-bold">Luckmoshy Jquery Pagination</span> is built completely with  Jquery elements so screen readers can announce the number of available links. Use a wrapping 
 element to identify it as a navigation section to screen readers and other assistive technologies.        </p>
        <div class="row mx-n2">
         <nav aria-label="Page navigation example mt-5">
 <ul id="luckmoshy" class="pagination pagination ">
   <!--luckmoshypagnation page are paging here-->
   </ul>
        </nav></div>
		<div class="row mx-n2 mt-5 mb-5 py-5">
          <div class="col-md px-2">
            <a href=" https://luckmoshy.github.io/luckmoshypagnation.js" class="btn btn-lg btn-secondary w-100 mb-3" onclick="ga('send', 'event', 'Jumbotron actions', 'Get started', 'Get started');">Documetation</a>
          </div>
        
      
       

### Know more about

Having trouble with Pages? Check out our [documentation]( https://luckmoshy.github.io/luckmoshypagnation.js) .
