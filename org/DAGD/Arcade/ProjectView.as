package org.DAGD.Arcade {
	
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.AntiAliasType;
	import flash.text.TextFormat;
	
	public class ProjectView extends MainView {

		public function ProjectView(data:MediaModel) {
			// load image and add 
			// create text box and add
			setupDesc(data.desc);
		}
		private function setupDesc(caption:String):void {			
			
			var label:TextField = new TextField();
			label.multiline = true;
			label.selectable = false;
			label.autoSize = TextFieldAutoSize.LEFT;
			label.defaultTextFormat = new TextFormat("Arial", 14, 0x0);
			label.text = caption;
			label.antiAliasType = AntiAliasType.NORMAL;
			label.x = 5;
			addChild(label);
		
		}
	}
}
