//constructor
var MyPhoneNumberPlugin = {
	getMyPhoneNumber: function(onSuccess, onError) {
		console.log("at getMyPhoneNumber");
		//return PhoneGap.exec(onSuccess, onError, "MyPhoneNumberPlugin", "getMyPhoneNumber", []);
		return PhoneGap.exec("MyPhoneNumberPlugin.getMyPhoneNumber", GetFunctionName(onSuccess), GetFunctionName(onError));
	}
}

/*PhoneGap.addConstructor(function() {
	if(!window.plugins) {
		window.plugins = {};
	}
	window.plugins.MyPhoneNumberPlugin = new MyPhoneNumberPlugin();
});*/
