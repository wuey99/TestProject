//------------------------------------------------------------------------------------------
// <$begin$/>
// <$end$/>
//------------------------------------------------------------------------------------------
package
{
	import Objects.Mickey.*;
	import Objects.Kablooey.*;
	
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
			
			addTask ([
				XTask.WAIT, 0x0100,

				function ():void {
					initPoweredByKablooey ();
					initCursor ();
				},
				
				XTask.RETN,
			]);	
		}			

		//------------------------------------------------------------------------------------------
		public override function initCursor ():void {
			var __x:Number;
			var __y:Number;
			
			__x = 0;
			__y = 0;
			
			m_mickeyCursorObject = xxx.getXLogicManager ().initXLogicObject (
				// parent
				null,
				// logicObject
				new MickeyCursorX () as XLogicObject,
				// item, layer, depth
				null, PLAYFIELD_LAYER, 999999999,
				// x, y, z
				__x, __y, 0,
				// scale, rotation
				1.0, 0
			) as MickeyCursorX;
		}
		
		//------------------------------------------------------------------------------------------
		public function initPoweredByKablooey ():void {
			xxx.getXLogicManager ().initXLogicObject (
				// parent
				null,
				// logicObject
				new PoweredByX () as XLogicObject,
				// item, layer, depth
				null, PLAYFIELD_LAYER, 999999999-1,
				// x, y, z
				800/2, 600 - 150, 0,
				// scale, rotation
				1.0, 0
			) as PoweredByX;
		}
		
	//------------------------------------------------------------------------------------------
	}
	
//------------------------------------------------------------------------------------------
}