//------------------------------------------------------------------------------------------
// <$begin$/>
// <$end$/>
//------------------------------------------------------------------------------------------
package
{
	import GX;
	import GX.External.CPMStar.*;
	import GX.External.FGL.*;
	import GX.Levels.*;
	import GX.Messages.*;
	import GX.Messages.Level.*;
	import GX.Mickey.*;
	import GX.Music.*;
	import GX.Text.*;
	import GX.Util.*;
	import GX.Zone.*;
	
	import X.*;
	import X.Bitmap.*;
	import X.Collections.*;
	import X.Game.*;
	import X.Geom.*;
	import X.Keyboard.*;
	import X.Resource.*;
	import X.Signals.XSignal;
	import X.Sound.*;
	import X.Task.*;
	import X.Texture.*;
	import X.Utils.*;
	import X.World.*;
	import X.World.Logic.*;
	import X.XML.*;
	import X.XMap.*;
	
	//------------------------------------------------------------------------------------------
	public class Game extends GApp {

		//------------------------------------------------------------------------------------------
		public function Game() {	
			trace (": starting: (Game)");
		}
		
		//------------------------------------------------------------------------------------------
		public override function setup (__assetsClass:Class, __mickeyXClass:Class, __parent:*, __timerInterval:Number=32):void {	
			trace (": Game: setup: ");
			
			super.setup (__assetsClass, __mickeyXClass, __parent, __timerInterval);
			
			trace (": G: setup: ");
			
			G.setup (this, m_XApp);
		}			

	//------------------------------------------------------------------------------------------
	}
	
//------------------------------------------------------------------------------------------
}