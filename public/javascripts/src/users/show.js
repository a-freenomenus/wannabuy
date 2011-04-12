(function($) {

  function usersShow($element) {

    // PRIVATE VARIABLES

    var $mainContainer = $element,
        $tabs;

    // constructor
    function init() {
      bindTabs();
      /* bindDomEvents(); */
    }

    // PRIVATE METHODS

    function bindTabs() {
      $tabs = $('ul.tabs', $mainContainer).tabs('div.panes > div', {
        effect  : 'fade'
        /* history : true */
      });
    }

    function bindDomEvents() {
    }

    // run constructor
    init();

    // PUBLIC METHODS

    return {
      // public methods go here
    };

  };

  // jQuery plugin method
  $.fn.usersShow = function() {
    return this.each(function() {
      var $this = $(this);

      // If not already stored, store plugin object in this element's data
      if (!$this.data('usersShow')) {
        $this.data('usersShow', usersShow($this));
      }
    });
  };

})(jQuery);

