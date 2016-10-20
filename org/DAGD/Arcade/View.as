package org.DAGD.Arcade {
	import flash.display.Sprite;

	public class View extends Sprite {
		public var currentView: int = 1;

		private var sideWindowW: Number = 250;
		private var sideWindowH: Number;
		//private var mediaWindowW:Number;
		//private var mediaWindowH:Number;

		private var sideView: SideView;
		private var mainView: MainView;
		private var thumbView: ThumbView;

		public function View() {
			//sideView = new SideView();
			//thumbView = new ThumbView();
		}
		public function layout(screenW: int, screenH: int): void {
			thumbView = new ThumbView();
			sideView = new SideView();

			if (currentView == 1) {
				sideView.x = 0;
				thumbView.x = sideView.x + sideWindowW;
				
				sideView.layout(sideWindowW, screenH);
				thumbView.layout(screenW - sideWindowW, screenH);
			}
		}

	}

}