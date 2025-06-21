

// custom.js
$(function() {
  // When hovering over a submenu item, add 'submenu-hover' to the parent menu item
  $('.sidebar-menu .treeview-menu > li > a').hover(
    function() {
      $(this).closest('.treeview').children('a').addClass('submenu-hover');
    },
    function() {
      $(this).closest('.treeview').children('a').removeClass('submenu-hover');
    }
  );
});