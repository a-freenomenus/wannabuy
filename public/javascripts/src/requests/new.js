(function($) {

  function requestsNew($element) {

    // PRIVATE VARIABLES

    var $mainContainer = $element,
        $addCriterion,
        $form;

    // constructor
    function init() {
      $addCriterion = $('#add_criterion', $mainContainer);  
      $form = $('#new_request', $mainContainer);

      bindDomEvents();
    }

    // PRIVATE METHODS

    function bindDomEvents() {
      /* Add new criterion link */
      $addCriterion.bind('click', function(e) {
        e.preventDefault();
        
        if (!valid()) {
          return false;
        }
       
        var $this = $(this),
            max_fields = 5,
            data_n = parseInt($this.attr('data-n')) + 1;

        if ((data_n >= 1) && (data_n <= max_fields)) {
          var field_id = 'criterion_' + data_n;

          /* Create DOM-elements */
          var $criterionField = $('<div>').attr({ class : 'field'});
          var $label = $('<label>').attr({ for : 'request_' + field_id }).text('Параметр');
          var $input = $('<input>').attr({ 
                id    : 'request_' + field_id, 
                name  : 'request[criterions_attributes][' + data_n + '][name]', 
                class : 'criterion',
                size  : 30,
                type  : 'text'
          });

          var $value_label = $('<label>').attr({ for : 'request_value_' + data_n }).text('Значение');
          var $value_input = $('<input>').attr({ 
                id    : 'request_value_' + data_n, 
                name  : 'request[criterions_attributes][' + data_n + '][values_attributes][1][name]', 
                class : 'criterion_value',
                size  : 30,
                type  : 'text'
          });
          
          var $value_add = $('<a>').attr({ 
            href : '#', 
            id : 'value_add', 
            'data-n' : 1,
            'data-cr' : data_n  
          }).text('Добавить значение');

          /* Append elements to DOM */
          $label.appendTo($criterionField);
          $input.appendTo($criterionField);

          $value_label.appendTo($criterionField);
          $value_input.appendTo($criterionField);
          $value_add.appendTo($criterionField);
          $criterionField.insertBefore($this);
          
          /* Increase data-value */
          if (data_n < max_fields) {
            $this.attr('data-n', data_n);
          } else {
            $this.remove()
          }
        } 
      });

      $('#value_add').live('click', function(e) {
        e.preventDefault();

        var $this = $(this),
            data_cr = parseInt($this.attr('data-cr')),
            data_n = parseInt($this.attr('data-n')) + 1;

        var $value_label = $('<label>').attr({ for : 'request_value_' + data_n }).text('Значение');
        var $value_input = $('<input>').attr({ 
              id    : 'request_value_' + data_n, 
              name  : 'request[criterions_attributes][' + data_cr + '][values_attributes][' + data_n + '][name]', 
              class : 'criterion_value',
              size  : 30,
              type  : 'text'
        });

        $value_label.insertBefore($this);
        $value_input.insertBefore($this);
        $this.attr('data-n', data_n);

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

      /* return true; */
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

