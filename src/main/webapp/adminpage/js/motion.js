$(function () {
    $('#checkedAll').click(function (event) {
        var selected = this.checked;
        $(':checkbox').each(function () {    this.checked = selected; });
    });

    $("table").on('click', 'tr', function(e){
        if( $(e.target).is('input:checkbox') ) return;
        if( $(e.target).is('div.filter-option-inner-inner') ) return;
        if( $(e.target).hasClass('dropdown-item') ) return;
        if( $(e.target).is('span.text') ) return;
        var chkbox = $(this).find('td:first-child :checkbox');
        chkbox.prop('checked', !chkbox.prop('checked'));
    });       

 });

 $(document).ready(function() {
    $('#example').DataTable( {
        columnDefs: [ {
            orderable: false,
            className: 'select-checkbox',
            targets:   0
        } ],
        select: {
            style:    'os',
            selector: 'td:first-child'
        },
        order: [[ 1, 'asc' ]]
    } );
} );