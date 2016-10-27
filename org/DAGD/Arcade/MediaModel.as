package org.DAGD.Arcade {
	import flash.filesystem.File;

	
	public class MediaModel {

		public var title:String;
		public var desc:String;
		public var imgURL:String;
		
		public function MediaModel(xml:XML) {
			title = xml.name;
			desc = xml.desc;
			imgURL = File.applicationDirectory.resolvePath(xml.thumb).nativePath;
		}
	}
}
