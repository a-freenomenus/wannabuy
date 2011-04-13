(function($) {

  function requestsNew($element) {

    // PRIVATE VARIABLES

    var $mainContainer = $element,
        $addCriteria,
        $form;

    // constructor
    function init() {
      $addCriteria = $('#add_criteria', $mainContainer);  
      $form = $('#new_request', $mainContainer);

      bindDomEvents();
    }

    // PRIVATE METHODS

    function bindDomEvents() {
      /* Add new criteria link */
      $addCriteria.bind('click', function(e) {
        e.preventDefault();
        
        if (!valid()) {
          return false;
        }
       
        var $this = $(this),
            max_fields = 5,
            data_n = parseInt($this.attr('data-n')) + 1;

        if ((data_n >= 1) && (data_n <= max_fields)) {
          var field_id = 'criteria_' + data_n;

          /* Create DOM-elements */
          var $criteriaField = $('<div>').attr({ class : 'field'});
          var $label = $('<label>').attr({ for : 'request_' + field_id }).text('Параметр');
          var $input = $('<input>').attr({ 
                id    : 'request_' + field_id, 
                name  : 'request[' + field_id + ']', 
                size  : 30,
                type  : 'text'
          });

          /* Append elements to DOM */
          $label.appendTo($criteriaField);
          $input.appendTo($criteriaField);
          $criteriaField.insertBefore($this);
          
          /* Increase data-value */
          if (data_n < max_fields) {
            $this.attr('data-n', data_n);
          } else {
            $this.remove()
          }
        } 
      });

      /* Submit button */
      $form.submit(function(e) {
        e.preventDefault;

        if (valid()) {
          return true;
        } else {
          return false;
        }
      });
    }
    
    // TODO: MOVE THIS FUNCTIONALITY TO PLUGIN
    /* Validate required fields */
    function valid() {
      var valid = true;
      $('input.required, textarea.required', '#new_request').each(function() {
        var $this = $(this);
        if ($this.val() == '') {
          $this.parent().addClass('field_with_errors');
          valid = false;
        } else {
          $this.parent().removeClass('field_with_errors');
        }
      });

      if (valid) {
        $('#flashes').text('').removeClass('flash_error');
        return true;
      } else {
        $('#flashes').text('Заполните обязательные поля!').addClass('flash_error');
        return false;
      }
    }

    // run constructor
    init();

    // PUBLIC METHODS

    return {
      // public methods go here
    };

  };

  // jQuery plugin method
  $.fn.requestsNew = function() {
    return this.each(function() {
      var $this = $(this);

      // If not already stored, store plugin object in this element's data
      if (!$this.data('requestsNew')) {
        $this.data('requestsNew', requestsNew($this));
      }
    });
  };

})(jQuery);

