package org.DAGD.Arcade
{

	import flash.display.MovieClip;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.xml.XMLDocument;
	import flash.filesystem.File;
	import flash.geom.*;
	import flash.text.TextField;
	import flash.display.Loader;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.system.fscommand;

	public class ArcadeOS extends MovieClip
	{

		private static const DATA_PATH:String = "./content/content.xml";
		private var data:XML;
		private var collection:Array = new Array();
		
		private var sideView:SideView;
		private var mainView:MainView;
		
		public function ArcadeOS()
		{
			//launchExe("content/procexp.exe", "/t");
			screenSetup();
			loadData();
		}
		private function loadData():void {
			var request:URLRequest = new URLRequest(DATA_PATH);
			var loader:URLLoader = new URLLoader(request);
			loader.addEventListener(Event.COMPLETE, doneLoadingData);
		}
		private function doneLoadingData(e:Event):void
		{
			var data:String = (e.target as URLLoader).data;
			var xml:XML = new XML(data);
				
			for(var i:int = 0; i < xml.media.length(); i++){	
				var media:Media = new Media(xml.media[i]);
				collection.push(media);
				addChild(media);
			}
			layoutSetup();
		}

		private function layoutSetup():void {
			trace(collection.length);
			
			for(var i = 0; i < collection.length; i++){
				var media:Media = collection[i];
				var cols:Number = Math.floor(stage.fullScreenWidth / Media.BX);
				var spaceX:int = Media.BX + Media.MARG;
				var spaceY:int = Media.BY + Media.MARG;
				var gridX:int = i % cols;
				var gridY:int = Math.floor(i / cols);
				
				media.x = gridX * spaceX;
				media.y = gridY * spaceY;
				trace(media.x, media.y);
			}
			//trace(gridX);
			//trace(gridY);
			//trace(media.BX);
			//trace(cols);
		}
		private function screenSetup():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.nativeWindow.bounds = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
		}
		private function launchExe(path:String, args:String = ""):void {
			var appInfo:NativeProcessStartupInfo = new NativeProcessStartupInfo();
			appInfo.executable = File.applicationDirectory.resolvePath(path);
			if(args != "") appInfo.arguments.push(args);
			
			var app:NativeProcess = new NativeProcess();
			app.start(appInfo);
		}
	}
}