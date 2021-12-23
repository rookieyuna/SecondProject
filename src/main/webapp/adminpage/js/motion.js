$(function () {
    $('#checkedAll').click(function (event) {
        var selected = this.checked;
        $(':checkbox').each(function () {    this.checked = selected; });
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