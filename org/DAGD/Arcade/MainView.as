package org.DAGD.Arcade {
	
	public class MainView extends View {


		private var sideView: SideView;
		private var mainView: MainView;
		private var thumbView: ThumbView;		
		
		public function MainView() {
			// constructor code
		}
		override public function layout(screenW: int, screenH: int): void {
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
