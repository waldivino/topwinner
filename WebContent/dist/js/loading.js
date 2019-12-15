// Create
options = {
	speed : 80,
	limit : 100,

};

myplugin = $('#p1').cprogress(options);

// Create on Event
$('#create').click(function() {
	if (!myplugin) {
		myplugin = $('#p1').cprogress(options);
	}
});

// Destroy
$('#destroy').click(function() {
	if (myplugin) {
		myplugin = myplugin.destroy();
	}
});

// Start
$('#play').click(function() {
	if (myplugin) {
		myplugin.start();
	}
});

// Stop
$('#pause').click(function() {
	if (myplugin) {
		myplugin.stop();
	}
});

// Reset
$('#reset').click(function() {
	if (myplugin) {
		myplugin.reset();
	}
});

// Change options (you can change all options, including images)
$('#speed10').click(function() {
	if (myplugin) {
		myplugin.options({
			speed : 10
		});
	}
});