package org.DAGD.Arcade {
	import flash.filesystem.File;

	
	public class MediaModel {

		public var title:String;
		public var desc:String;
		public var imgURL:String;
		
		/**
		* MediaModel() is the model of media data and what should be stored
		* for each piece of media presented in the MainView
		*
		* @param xml:XML
		* pulls information from the XML doc to be used in its respective view
		*/
		public function MediaModel(xml:XML) {
			title = xml.name;
			desc = xml.desc;
			imgURL = File.applicationDirectory.resolvePath(xml.thumb).nativePath;
		}
	}
}
