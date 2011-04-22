$(function(){

  var PaintboxView = Backbone.View.extend({

    tagName: 'ul',  
    id: 'paintbox',

    initialize: function(options){
      _.bindAll(this, 'refresh');     
      this.collection.bind('refresh', this.refresh);
      this.collection.fetch();    
    },

    refresh: function(){
      $(this.el).html('');
      var views = this.collection.map(function(m){
        return (new SwatchView({ model : m })).el;
      });
      $(this.el).append(views);
    }

  });
  
  
  var SwatchView = Backbone.View.extend({

    tagName: 'li',
    className: 'swatch',

    initialize: function(){
      this.render();
    },

    render: function(){
      $(this.el).css('background', this.model.get('color').value);
    }

  });

  

  var Swatch = Backbone.Model.extend({

    initialize: function(){}  

  });


  var Swatches = Backbone.Collection.extend({

    model: Swatch,

    initialize: function(options){}

  });


  var Paintbox = Backbone.Model.extend({

    initialize: function() {
      this.swatches = new Swatches;
      this.swatches.url = '/users/' + this.id + '/swatches';      
      this.view = new PaintboxView({ el: "#paintbox", collection: this.swatches });
    }

  });

  var Inbox = new Paintbox({ id: $('body').data('id') });

  
});