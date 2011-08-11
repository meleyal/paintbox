$(function(){

	//
	// Models
	//

	var Swatch = Backbone.Model.extend({
		url: '/swatches'
	});


	var Swatches = Backbone.Collection.extend({
		model: Swatch,
		url: '/swatches'
	});


	var Paintbox = Backbone.Model.extend({
		initialize: function() {
			this.swatches = new Swatches();
			this.swatches.url = '/users/' + this.id + '/swatches';      
			this.view = new PaintboxView({ el: "#paintbox", collection: this.swatches });
		}
	});

	//
	// Views
	//

	var AppView = Backbone.View.extend({

		el: $('body'),

		events: {
			'submit #new_swatch' : 'addSwatch'			
		},

		addSwatch: function(e){
			e.preventDefault();
			var val = $('#swatch_colors_value').val();			
			var data = { swatch: { colors: { value: val } } };
			$(data).serializeObject();
			var s = new Swatch(data);
			s.save(null, { success: function(){ Inbox.swatches.fetch(); }});
		}

	});

	var PaintboxView = Backbone.View.extend({

		tagName: 'ul',  
		id: 'paintbox',

		initialize: function(options){
			_.bindAll(this, 'refresh');     
			this.collection.bind('refresh', this.refresh);
			this.collection.bind('reset', this.refresh);
			this.collection.bind('add', this.refresh);
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

	if ($('body').is('#profile')) {
		var Inbox = new Paintbox({ id: $('body').data('id') });
		var App = new AppView({ el: $('body') });
	}

});