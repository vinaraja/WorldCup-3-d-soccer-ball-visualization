package
{
	import away3d.cameras.Camera3D;
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.Scene3D;
	import away3d.containers.View3D;
	import away3d.controllers.HoverController;
	import away3d.core.math.Vector3DUtils;
	import away3d.core.render.BackgroundImageRenderer;
	import away3d.entities.Mesh;
	import away3d.lights.PointLight;
	import away3d.materials.ColorMaterial;
	import away3d.materials.lightpickers.StaticLightPicker;
	import away3d.materials.TextureMaterial;
	import away3d.primitives.CubeGeometry;
	import away3d.primitives.CylinderGeometry;
	import away3d.primitives.SphereGeometry;
	import away3d.primitives.TorusGeometry;
	import away3d.primitives.PlaneGeometry;
	import away3d.textures.BitmapTexture;
	import com.gestureworks.cml.away3d.elements.Container3D;
	import com.gestureworks.cml.away3d.elements.Geometry;
	import com.gestureworks.cml.away3d.geometries.PlaneGeometry;
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.elements.Button;
	import com.gestureworks.cml.elements.Container;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.core.CML;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.leapmotion.leap.Matrix;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.display.StageDisplayState;
	import flash.events.TimerEvent;
	import flash.events.TouchEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.geom.Matrix3D;
	import flash.geom.Rectangle;
	import flash.geom.Vector3D;
	import away3d.utils.Cast;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import away3d.entities.Sprite3D;
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	
	//[SWF(backgroundColor="#000000",height="1024",width="2048",allowfullscreen="true")]
	
	public class Main extends GestureWorks
	{
		// images used for textures for the inner sphere
		[Embed(source="assets1/1930.jpg")]
		public static var EarthImage:Class;
		public static var earth:Bitmap = new EarthImage();
		[Embed(source="assets1/1934.jpg")]
		public static var bg1:Class;
		public static var b1:Bitmap = new bg1();
		[Embed(source="assets1/1938.jpg")]
		public static var bg2:Class;
		public static var b2:Bitmap = new bg2();
		[Embed(source="assets1/1950.jpg")]
		public static var bg3:Class;
		public static var b3:Bitmap = new bg3();
		[Embed(source="assets1/1954.jpg")]
		public static var bg4:Class;
		public static var b4:Bitmap = new bg4();
		[Embed(source="assets1/1958.jpg")]
		public static var bg5:Class;
		public static var b5:Bitmap = new bg5();
		[Embed(source="assets1/1962.jpg")]
		public static var bg6:Class;
		public static var b6:Bitmap = new bg6();
		[Embed(source="assets1/1966.jpg")]
		public static var bg7:Class;
		public static var b7:Bitmap = new bg7();
		[Embed(source="assets1/1970.jpg")]
		public static var bg8:Class;
		public static var b8:Bitmap = new bg8();
		[Embed(source="assets1/1974.jpg")]
		public static var bg9:Class;
		public static var b9:Bitmap = new bg9();
		[Embed(source="assets1/1978.jpg")]
		public static var bg10:Class;
		public static var b10:Bitmap = new bg10();
		[Embed(source="assets1/1982.jpg")]
		public static var bg11:Class;
		public static var b11:Bitmap = new bg11();
		[Embed(source="assets1/1986.jpg")]
		public static var bg12:Class;
		public static var b12:Bitmap = new bg12();
		[Embed(source="assets1/1990.jpg")]
		public static var bg13:Class;
		public static var b13:Bitmap = new bg13();
		[Embed(source="assets1/1994.jpg")]
		public static var bg14:Class;
		public static var b14:Bitmap = new bg14();
		[Embed(source="assets1/1998.jpg")]
		public static var bg15:Class;
		public static var b15:Bitmap = new bg15();
		[Embed(source="assets1/2002.jpg")]
		public static var bg16:Class;
		public static var b16:Bitmap = new bg16();
		[Embed(source="assets1/2006.jpg")]
		public static var bg17:Class;
		public static var b17:Bitmap = new bg17();
		[Embed(source="assets1/2010.jpg")]
		public static var bg18:Class;
		public static var b18:Bitmap = new bg18();
		[Embed(source="assets1/2014.jpg")]
		public static var bg19:Class;
		public static var b19:Bitmap = new bg19();
		//textures for the background
		[Embed(source="assets1/1.jpg")]
		private var bac1:Class;
		private var bm1:Bitmap = new bac1();
		[Embed(source="assets1/2.jpg")]
		private var bac2:Class;
		private var bm2:Bitmap = new bac2();
		[Embed(source="assets1/3.jpg")]
		public var bac3:Class;
		public var bm3:Bitmap = new bac3();
		[Embed(source="assets1/4.jpg")]
		public var bac4:Class;
		public var bm4:Bitmap = new bac4();
		[Embed(source="assets1/5.jpg")]
		public var bac5:Class;
		public var bm5:Bitmap = new bac5();
		[Embed(source="assets1/6.jpg")]
		public var bac6:Class;
		public var bm6:Bitmap = new bac6();
		[Embed(source="assets1/7.jpg")]
		public var bac7:Class;
		public var bm7:Bitmap = new bac7();
		[Embed(source="assets1/8.jpg")]
		public var bac8:Class;
		public var bm8:Bitmap = new bac8();
		[Embed(source="assets1/9.jpg")]
		public var bac9:Class;
		public var bm9:Bitmap = new bac9();
		[Embed(source="assets1/10.jpg")]
		public var bac10:Class;
		public var bm10:Bitmap = new bac10();
		[Embed(source="assets1/11.jpg")]
		public var bac11:Class;
		public var bm11:Bitmap = new bac11();
		[Embed(source="assets1/12.jpg")]
		public var bac12:Class;
		public var bm12:Bitmap = new bac12();
		[Embed(source="assets1/13.jpg")]
		public var bac13:Class;
		public var bm13:Bitmap = new bac13();
		[Embed(source="assets1/14.jpg")]
		public var bac14:Class;
		public var bm14:Bitmap = new bac14();
		[Embed(source="assets1/15.jpg")]
		public var bac15:Class;
		public var bm15:Bitmap = new bac15();
		[Embed(source="assets1/16.jpg")]
		public var bac16:Class;
		public var bm16:Bitmap = new bac16();
		[Embed(source="assets1/17.jpg")]
		public var bac17:Class;
		public var bm17:Bitmap = new bac17();
		[Embed(source="assets1/18.jpg")]
		public var bac18:Class;
		public var bm18:Bitmap = new bac18();
		[Embed(source="assets1/19.jpg")]
		public var bac19:Class;
		public var bm19:Bitmap = new bac19();
		[Embed(source="assets1/20.jpg")]
		public var bac20:Class;
		public var bm20:Bitmap = new bac20();
		
		private var _telnetClient:Telnet;
		private var _numLayingOut:int = 0; // global variable to track number of collections presently in layout tween
		private var _organizing:Boolean = false;
		private var sheet:CML = new CML();
		private var scene:Scene3D;
		private var camera:Camera3D;
		private var view:View3D;
		private var _ground:Mesh;
		private var group:ObjectContainer3D;
		private var _sphere:SphereGeometry;
		private var _cube:CubeGeometry;
		private var centerCube:CubeGeometry;
		private var cylinder:CylinderGeometry;
		private var torus:TorusGeometry;
		private var lightpicker:StaticLightPicker;
		private var pointlight:PointLight;
		private var _lastVerticeIndex:int = 0;
		private var material:ColorMaterial;
		private var totalY:int;
		private var totalX:int;
		private var totalZ:int;
		var _balls:ObjectContainer3D;
		var _parent:ObjectContainer3D;
		var _parent1:ObjectContainer3D;
		var flag:int = 1;
		var myTouchSprite:TouchSprite;
		var dx:Number;
		var dy:Number;
		var initialdx:Number;
		var initialdy:Number;
		var arraydx:Array = new Array();
		var k:int = 0;
		var arraydy:Array = new Array();
		var l:int = 0;
		var angles:Vector3D;
		var yrot:Number ;
		var xrot:Number ;
		var transformrot:Matrix3D;
		private var _idleTimer:Timer;
		var file:File;
		var date:Date;
		var newrotation:Number;
		
		
		public function Main()
		{
			
			// set up the stage
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			file = File.desktopDirectory.resolvePath("Assest1/new1.txt");
			date = new Date();
			newrotation = 0;
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
			cml = "library/cml/main.cml";
			gml = "library/gml/gestures.gml";
			// Initialise Papervision3D
			init3D();
			  
			trace("started");
			// Initialise frame-enter loop
			this.addEventListener(Event.ENTER_FRAME, loop);
		
		}
		
		private function cmlInit(e:Event):void
		{
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			if (auxDisplay == "sos" || auxDisplay == "sosEmulator")
			{
				telnetInit();
				trace("call teleet Init");
				_idleTimer = new Timer(600000);
				_idleTimer.start();
				_idleTimer.addEventListener(TimerEvent.TIMER, idleTimerHandler);
			}
			
		}
		
		private function idleTimerHandler(e:Event):void 
		{
			var playlist:String = CMLParser.cmlData.attribute("idlePlaylist");
			var ba:ByteArray = new ByteArray();
			
			
			_idleTimer.stop();

			// open idle playlist
			ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
			_telnetClient.writeBytesToSocket(ba);
			ba.clear();
			
			// enable autorun
			ba.writeMultiByte("set_auto_presentation_mode 1\n", "UTF-8");
			_telnetClient.writeBytesToSocket(ba);
			ba.clear();

			_telnetClient.writeBytesToSocket(ba);
		}
		
		private function telnetInit():void
		{
			//addEventListener("tcpConnectionError", tcpConnectionErrorHandler);
			trace("telnetInit()");
			var telnetServer:String;
			var telnetPort:int;
			
			if ((telnetServer = CMLParser.cmlData.attribute("server")) && (telnetPort = int(CMLParser.cmlData.attribute("port"))))
			{
				_telnetClient = new Telnet(telnetServer, telnetPort);
				trace("telnetInit() 1");
			}
			else
			{
				trace("Error reading telnetServer and/or telnetPort from CML!");
				errorPopup("Error reading telnetServer and/or telnetPort from CML!");
			}
		}
		
		private function createButton():void //Button Initialization
		{
			var goButton1:SimpleButton = new SimpleButton();
			var goButton2:SimpleButton = new SimpleButton();
			var goButton3:SimpleButton = new SimpleButton();
			var goButton4:SimpleButton = new SimpleButton();
			var goButton5:SimpleButton = new SimpleButton();
			var goButton6:SimpleButton = new SimpleButton();
			var goButton7:SimpleButton = new SimpleButton();
			var goButton8:SimpleButton = new SimpleButton();
			var goButton9:SimpleButton = new SimpleButton();
			var goButton10:SimpleButton = new SimpleButton();
			var goButton11:SimpleButton = new SimpleButton();
			var goButton12:SimpleButton = new SimpleButton();
			var goButton13:SimpleButton = new SimpleButton();
			var goButton14:SimpleButton = new SimpleButton();
			var goButton15:SimpleButton = new SimpleButton();
			var goButton16:SimpleButton = new SimpleButton();
			var goButton17:SimpleButton = new SimpleButton();
			var goButton18:SimpleButton = new SimpleButton();
			var goButton19:SimpleButton = new SimpleButton();
			var goButton20:SimpleButton = new SimpleButton();
			
			var myButtonSprite1:Sprite = new Sprite();
			myButtonSprite1.graphics.lineStyle(1, 0x555555);
			myButtonSprite1.graphics.beginFill(0xff000, 1);
			myButtonSprite1.graphics.drawCircle(223, 1003, 45);
			myButtonSprite1.graphics.endFill();
			var myButtonSprite2:Sprite = new Sprite();
			myButtonSprite2.graphics.lineStyle(1, 0x555555);
			myButtonSprite2.graphics.beginFill(0xff000, 1);
			myButtonSprite2.graphics.drawCircle(239, 910, 45);
			myButtonSprite2.graphics.endFill();
			var myButtonSprite3:Sprite = new Sprite();
			myButtonSprite3.graphics.lineStyle(1, 0x555555);
			myButtonSprite3.graphics.beginFill(0xff000, 1);
			myButtonSprite3.graphics.drawCircle(270, 818, 45);
			myButtonSprite3.graphics.endFill();
			var myButtonSprite4:Sprite = new Sprite();
			myButtonSprite4.graphics.lineStyle(1, 0x555555);
			myButtonSprite4.graphics.beginFill(0xff000, 1);
			myButtonSprite4.graphics.drawCircle(310, 710, 45);
			myButtonSprite4.graphics.endFill();
			var myButtonSprite5:Sprite = new Sprite();
			myButtonSprite5.graphics.lineStyle(1, 0x555555);
			myButtonSprite5.graphics.beginFill(0xff000, 1);
			myButtonSprite5.graphics.drawCircle(370, 620, 45);
			myButtonSprite5.graphics.endFill();
			var myButtonSprite6:Sprite = new Sprite();
			myButtonSprite6.graphics.lineStyle(1, 0x555555);
			myButtonSprite6.graphics.beginFill(0xff000, 1);
			myButtonSprite6.graphics.drawCircle(440, 550, 45);
			myButtonSprite6.graphics.endFill();
			var myButtonSprite7:Sprite = new Sprite();
			myButtonSprite7.graphics.lineStyle(1, 0x555555);
			myButtonSprite7.graphics.beginFill(0xff000, 1);
			myButtonSprite7.graphics.drawCircle(510, 480, 45);
			myButtonSprite7.graphics.endFill();
			var myButtonSprite8:Sprite = new Sprite();
			myButtonSprite8.graphics.lineStyle(1, 0x555555);
			myButtonSprite8.graphics.beginFill(0xff000, 1);
			myButtonSprite8.graphics.drawCircle(610, 430, 45);
			myButtonSprite8.graphics.endFill();
			var myButtonSprite9:Sprite = new Sprite();
			myButtonSprite9.graphics.lineStyle(1, 0x555555);
			myButtonSprite9.graphics.beginFill(0xff000, 1);
			myButtonSprite9.graphics.drawCircle(700, 380, 45);
			myButtonSprite9.graphics.endFill();
			var myButtonSprite10:Sprite = new Sprite();
			myButtonSprite10.graphics.lineStyle(1, 0x555555);
			myButtonSprite10.graphics.beginFill(0xff000, 1);
			myButtonSprite10.graphics.drawCircle(810, 350, 45);
			myButtonSprite10.graphics.endFill();
			var myButtonSprite11:Sprite = new Sprite();
			myButtonSprite11.graphics.lineStyle(1, 0x555555);
			myButtonSprite11.graphics.beginFill(0xff000, 1);
			myButtonSprite11.graphics.drawCircle(1130, 350, 45);
			myButtonSprite11.graphics.endFill();
			var myButtonSprite12:Sprite = new Sprite();
			myButtonSprite12.graphics.lineStyle(1, 0x555555);
			myButtonSprite12.graphics.beginFill(0xff000, 1);
			myButtonSprite12.graphics.drawCircle(1233, 380, 45);
			myButtonSprite12.graphics.endFill();
			var myButtonSprite13:Sprite = new Sprite();
			myButtonSprite13.graphics.lineStyle(1, 0x555555);
			myButtonSprite13.graphics.beginFill(0xff000, 1);
			myButtonSprite13.graphics.drawCircle(1330, 430, 45);
			myButtonSprite13.graphics.endFill();
			var myButtonSprite14:Sprite = new Sprite();
			myButtonSprite14.graphics.lineStyle(1, 0x555555);
			myButtonSprite14.graphics.beginFill(0xff000, 1);
			myButtonSprite14.graphics.drawCircle(1420, 480, 45);
			myButtonSprite14.graphics.endFill();
			var myButtonSprite15:Sprite = new Sprite();
			myButtonSprite15.graphics.lineStyle(1, 0x555555);
			myButtonSprite15.graphics.beginFill(0xff000, 1);
			myButtonSprite15.graphics.drawCircle(1500, 550, 45);
			myButtonSprite15.graphics.endFill();
			var myButtonSprite16:Sprite = new Sprite();
			myButtonSprite16.graphics.lineStyle(1, 0x555555);
			myButtonSprite16.graphics.beginFill(0xff000, 1);
			myButtonSprite16.graphics.drawCircle(1560, 620, 45);
			myButtonSprite16.graphics.endFill();
			var myButtonSprite17:Sprite = new Sprite();
			myButtonSprite17.graphics.lineStyle(1, 0x555555);
			myButtonSprite17.graphics.beginFill(0xff000, 1);
			myButtonSprite17.graphics.drawCircle(1620, 710, 45);
			myButtonSprite17.graphics.endFill();
			var myButtonSprite18:Sprite = new Sprite();
			myButtonSprite18.graphics.lineStyle(1, 0x555555);
			myButtonSprite18.graphics.beginFill(0xff000, 1);
			myButtonSprite18.graphics.drawCircle(1660, 818, 45);
			myButtonSprite18.graphics.endFill();
			var myButtonSprite19:Sprite = new Sprite();
			myButtonSprite19.graphics.lineStyle(1, 0x555555);
			myButtonSprite19.graphics.beginFill(0xff000, 1);
			myButtonSprite19.graphics.drawCircle(1690, 910, 45);
			myButtonSprite19.graphics.endFill();
			var myButtonSprite20:Sprite = new Sprite();
			myButtonSprite20.graphics.lineStyle(1, 0x555555);
			myButtonSprite20.graphics.beginFill(0xff000, 1);
			myButtonSprite20.graphics.drawCircle(1700, 1003, 45);
			myButtonSprite20.graphics.endFill();
			
			myTouchSprite = new TouchSprite();
			myTouchSprite.graphics.lineStyle(1, 0x555555);
			myTouchSprite.graphics.beginFill(0xff000, 1);
			myTouchSprite.graphics.drawCircle(950,1000,500)
			myTouchSprite.graphics.endFill();
			myTouchSprite.gestureList = {"n-drag": true};
			goButton1.overState = goButton1.downState = goButton1.upState = goButton1.hitTestState = myButtonSprite1;
			goButton2.overState = goButton2.downState = goButton2.upState = goButton2.hitTestState = myButtonSprite2;
			goButton3.overState = goButton3.downState = goButton3.upState = goButton3.hitTestState = myButtonSprite3;
			goButton4.overState = goButton4.downState = goButton4.upState = goButton4.hitTestState = myButtonSprite4;
			goButton5.overState = goButton5.downState = goButton5.upState = goButton5.hitTestState = myButtonSprite5;
			goButton6.overState = goButton6.downState = goButton6.upState = goButton6.hitTestState = myButtonSprite6;
			goButton7.overState = goButton7.downState = goButton7.upState = goButton7.hitTestState = myButtonSprite7;
			goButton8.overState = goButton8.downState = goButton8.upState = goButton8.hitTestState = myButtonSprite8;
			goButton9.overState = goButton9.downState = goButton9.upState = goButton9.hitTestState = myButtonSprite9;
			goButton10.overState = goButton10.downState = goButton10.upState = goButton10.hitTestState = myButtonSprite10;
			goButton11.overState = goButton11.downState = goButton11.upState = goButton11.hitTestState = myButtonSprite11;
			goButton12.overState = goButton12.downState = goButton12.upState = goButton12.hitTestState = myButtonSprite12;
			goButton13.overState = goButton13.downState = goButton13.upState = goButton13.hitTestState = myButtonSprite13;
			goButton14.overState = goButton14.downState = goButton14.upState = goButton14.hitTestState = myButtonSprite14;
			goButton15.overState = goButton15.downState = goButton15.upState = goButton15.hitTestState = myButtonSprite15;
			goButton16.overState = goButton16.downState = goButton16.upState = goButton16.hitTestState = myButtonSprite16;
			goButton17.overState = goButton17.downState = goButton17.upState = goButton17.hitTestState = myButtonSprite17;
			goButton18.overState = goButton18.downState = goButton18.upState = goButton18.hitTestState = myButtonSprite18;
			goButton19.overState = goButton19.downState = goButton19.upState = goButton19.hitTestState = myButtonSprite19;
			goButton20.overState = goButton20.downState = goButton20.upState = goButton20.hitTestState = myButtonSprite20;
			
			goButton1.alpha = 0;
			goButton2.alpha = 0;
			goButton3.alpha = 0;
			goButton4.alpha = 0;
			goButton5.alpha = 0;
			goButton6.alpha = 0;
			goButton7.alpha = 0;
			goButton8.alpha = 0;
			goButton9.alpha = 0;
			goButton10.alpha = 0;
			goButton11.alpha = 0;
			goButton12.alpha = 0;
			goButton13.alpha = 0;
			goButton14.alpha = 0;
			goButton15.alpha = 0;
			goButton16.alpha = 0;
			goButton17.alpha = 0;
			goButton18.alpha = 0;
			goButton19.alpha = 0;
			goButton20.alpha = 0;
			myTouchSprite.alpha = 0;
			
			addChild(goButton1);
			addChild(goButton2);
			addChild(goButton3);
			addChild(goButton4);
			addChild(goButton5);
			addChild(goButton6);
			addChild(goButton7);
			addChild(goButton8);
			addChild(goButton9);
			addChild(goButton10);
			addChild(goButton11);
			addChild(goButton12);
			addChild(goButton13);
			addChild(goButton14);
			addChild(goButton15);
			addChild(goButton16);
			addChild(goButton17);
			addChild(goButton18);
			addChild(goButton19);
			addChild(goButton20);
			
			addChild(myTouchSprite);
			myTouchSprite.gestureList={"n-drag":true}
			goButton1.addEventListener(MouseEvent.CLICK, buttonClick1);
			goButton2.addEventListener(MouseEvent.CLICK, buttonClick2);
			goButton3.addEventListener(MouseEvent.CLICK, buttonClick3);
			goButton4.addEventListener(MouseEvent.CLICK, buttonClick4);
			goButton5.addEventListener(MouseEvent.CLICK, buttonClick5);
			goButton6.addEventListener(MouseEvent.CLICK, buttonClick6);
			goButton7.addEventListener(MouseEvent.CLICK, buttonClick7);
			goButton8.addEventListener(MouseEvent.CLICK, buttonClick8);
			goButton9.addEventListener(MouseEvent.CLICK, buttonClick9);
			goButton10.addEventListener(MouseEvent.CLICK, buttonClick10);
			goButton11.addEventListener(MouseEvent.CLICK, buttonClick11);
			goButton12.addEventListener(MouseEvent.CLICK, buttonClick12);
			goButton13.addEventListener(MouseEvent.CLICK, buttonClick13);
			goButton14.addEventListener(MouseEvent.CLICK, buttonClick14);
			goButton15.addEventListener(MouseEvent.CLICK, buttonClick15);
			goButton16.addEventListener(MouseEvent.CLICK, buttonClick16);
			goButton17.addEventListener(MouseEvent.CLICK, buttonClick17);
			goButton18.addEventListener(MouseEvent.CLICK, buttonClick18);
			goButton19.addEventListener(MouseEvent.CLICK, buttonClick19);
			goButton20.addEventListener(MouseEvent.CLICK, buttonClick20);
			
			myTouchSprite.addEventListener(GWGestureEvent.DRAG, gestureDragHandler);
		    
		}
		
		private function gestureDragHandler(e:GWGestureEvent):void
		{
			//helps in rotating the inner sphere across Y axis
			dx = myTouchSprite.mouseX;
			dy = myTouchSprite.mouseY;
			var rotation:Number = 1;
			var matrix:Matrix3D;
			xrot = _balls.rotationX;
			yrot= _balls.rotationY;
			myTouchSprite.addEventListener(GWGestureEvent.COMPLETE, touchmove);
			_idleTimer.reset();
			_idleTimer.start();
			if (flag == 1)
			{
				var x:int = 0;
				
			 initialdx = dx;
			 initialdy = dy;
			
			}
			
			if (dx != arraydx[k-1] && dy != arraydy[l-1] )
			{
			arraydx[k] = dx;//records movement across x axis
			arraydy[l] = dy;//records movement across y axis
			k++;
			l++;
		
			
			if ((dy == arraydy[k-2] && dx > arraydx[k-2])||(dy <= arraydy[k-2]+5 && dy > arraydy[k-2]-5 && dx > arraydx[k-2]))
		{
			//trace ("inside X axis")
			rotation = Math.abs(((dx - arraydx[k - 2] )/ 30)*3)	
			var upVec:Vector3D = new Vector3D(0,0,0);
			matrix = _balls.transform.clone();
			matrix.appendRotation(-rotation, Vector3D.Y_AXIS, upVec);
			matrix.appendRotation(0, upVec, matrix.position);
			matrix.appendRotation(0, upVec, matrix.position);
			_balls.transform = matrix; 
			newrotation = newrotation + rotation;
			var ba:ByteArray = new ByteArray();
			ba.writeMultiByte("set_tilt " +"0" + " " + "0" +" "+newrotation+ "\n", "UTF-8");
			_telnetClient.writeBytesToSocket(ba);
			ba.clear();
			
		}
		else if ((dy == arraydy[k-2] && dx <= arraydx[k-2])||(dy <= arraydy[k-2]+5 && dy > arraydy[k-2]-5 && dx <= arraydx[k-2]))
		{
			//trace ("inside X1 axis")
			rotation = Math.abs(((dx - arraydx[k - 2] )/ 10)*3)
			var upVec:Vector3D = new Vector3D(0,0,0);
			matrix = _balls.transform.clone();
			matrix.appendRotation(rotation, Vector3D.Y_AXIS, upVec);
			matrix.appendRotation(0, upVec, matrix.position);
			matrix.appendRotation(0, upVec, matrix.position);
			_balls.transform = matrix; 
			newrotation = newrotation + -rotation;
			//trace (rotation)
			var ba:ByteArray = new ByteArray();
			ba.writeMultiByte("set_tilt " +"0" + " " + "0" +" "+newrotation+ "\n", "UTF-8");
			_telnetClient.writeBytesToSocket(ba);
			ba.clear();
			
			
		}
		/**else if ((dx == arraydx[k-2] && dy > arraydy[k-2])||(dx <= arraydx[k-2]+5 && dx >arraydx[k-2]-5 && dy > arraydy[k-2]))
		{
			var upVec:Vector3D = new Vector3D(0,0,0);
			trace ("insiade Y axis")
			rotation = Math.abs(((dy - arraydy[k - 2] )/ 10)*3)
			trace (rotation)
			matrix = _balls.transform.clone();
			matrix.appendRotation(0, upVec, matrix.position);
			matrix.appendRotation(-rotation,Vector3D.X_AXIS, upVec);
			matrix.appendRotation(0, upVec, matrix.position);
			_balls.transform = matrix; 
			var ba:ByteArray = new ByteArray();
			ba.writeMultiByte("set_tilt " + 0 + -rotation + 0 + "\n", "UTF-8");
			_telnetClient.writeBytesToSocket(ba);
			ba.clear();
			
			
			
		}
		else if ((dx == arraydx[k-2] && dy <= arraydy[k-2])||(dx <= arraydx[k-2]+5 && dx >arraydx[k-2]-5 && dy <= arraydy[k-2]))
		{
			trace ("insiade Y1  axis")
			var upVec:Vector3D = new Vector3D(0,0,0);
			rotation = Math.abs(((dy - arraydy[k - 2] )/ 10)*3)
			trace (rotation)
			matrix = _balls.transform.clone();
			matrix.appendRotation(0, upVec, matrix.position);
			matrix.appendRotation(rotation,Vector3D.X_AXIS, upVec);
			matrix.appendRotation(0, upVec, matrix.position);
			_balls.transform = matrix; 
			var ba:ByteArray = new ByteArray();
			ba.writeMultiByte("set_tilt " + 0 + rotation + 0 + "\n", "UTF-8");
			_telnetClient.writeBytesToSocket(ba);
			ba.clear();
			
		}	
		else if (dx > arraydx[k - 2] && dy > arraydy[k - 2])
		{
			var upVec:Vector3D = new Vector3D(0,0,0);
			rotation = Math.abs(((dy - arraydy[k - 2] )/ 10)*3)
			trace ("z axis")
			matrix = _balls.transform.clone();
			matrix.appendRotation(-rotation, Vector3D.Y_AXIS, upVec);
			matrix.appendRotation(-rotation,Vector3D.X_AXIS, upVec);
			matrix.appendRotation(0, upVec, matrix.position);
			_balls.transform = matrix; 
			var ba:ByteArray = new ByteArray();
			ba.writeMultiByte("set_tilt " + -rotation + -rotation + 0 + "\n", "UTF-8");
			_telnetClient.writeBytesToSocket(ba);
			ba.clear();
		}
		else if (dx < arraydx[k - 2] && dy > arraydy[k - 2])
		{
			var upVec:Vector3D = new Vector3D(0,0,0);
			rotation = Math.abs(((dy - arraydy[k - 2] )/ 10)*3)
			trace ("z1 axis")
			matrix = _balls.transform.clone();
			matrix.appendRotation(rotation, Vector3D.Y_AXIS, upVec);
			matrix.appendRotation(-rotation,Vector3D.X_AXIS, upVec);
			matrix.appendRotation(0, upVec, matrix.position);
			_balls.transform = matrix; 
			var ba:ByteArray = new ByteArray();
			ba.writeMultiByte("set_tilt " + rotation + -rotation + 0 + "\n", "UTF-8");
			_telnetClient.writeBytesToSocket(ba);
			ba.clear();
		}
		else if (dx > arraydx[k - 2] && dy < arraydy[k - 2])
		{
			var upVec:Vector3D = new Vector3D(0,0,0);
			rotation = Math.abs(((dy - arraydy[k - 2] )/ 10)*3)
			trace ("z2 axis")
			matrix = _balls.transform.clone();
			matrix.appendRotation(-rotation, Vector3D.Y_AXIS, upVec);
			matrix.appendRotation(rotation,Vector3D.X_AXIS, upVec);
			matrix.appendRotation(0, upVec, matrix.position);
			_balls.transform = matrix; 
			var ba:ByteArray = new ByteArray();
			ba.writeMultiByte("set_tilt " + -rotation + rotation + 0 + "\n", "UTF-8");
			_telnetClient.writeBytesToSocket(ba);
			ba.clear();
		}
		else if (dx < arraydx[k - 2] && dy < arraydy[k - 2])
		{
			var upVec:Vector3D = new Vector3D(0,0,0);
			rotation = Math.abs(((dy - arraydy[k - 2] )/ 10)*3)
			trace ("z3 axis")
			matrix = _balls.transform.clone();
			matrix.appendRotation(rotation, Vector3D.Y_AXIS, upVec);
			matrix.appendRotation(rotation,Vector3D.X_AXIS, upVec);
			matrix.appendRotation(0, upVec, matrix.position);
			_balls.transform = matrix; 
			var ba:ByteArray = new ByteArray();
			ba.writeMultiByte("set_tilt " + rotation + rotation + 0 + "\n", "UTF-8");
			_telnetClient.writeBytesToSocket(ba);
			ba.clear();
		}**/	
			
			}
			
			
			
		}
		
		private function touchmove(e:GWGestureEvent):void 
		{
			//tracks the end of the touch movement
			trace ("move recorded");
			flag ++;
			k = 0;
			l = 0;
				
		}
		
		private function init3D():void //View Initialisation
		{
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac1().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(1);
		
		}
		
		private function createScene(id1:int):void // Ball initialisation
		{
			
			// Create a new sphere object using a bitmap material representing the earth
			var id:int = id1;
			//each id indicates the bit map to be loaded for the background
			if (id == 1)
			{
				var bm2:BitmapData = new EarthImage().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				//Creates a mesh of sphere geometry
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -250;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			//id=2 to id=20 works in a similar manner as id=1
			else if (id == 2)
			{
				var bm2:BitmapData = new bg1().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			else if (id == 3)
			{
				var bm2:BitmapData = new bg2().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			else if (id == 4)
			{
				var bm2:BitmapData = new bg3().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			else if (id == 5)
			{
				var bm2:BitmapData = new bg4().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			else if (id == 6)
			{
				var bm2:BitmapData = new bg5().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			else if (id == 7)
			{
				var bm2:BitmapData = new bg6().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			else if (id == 8)
			{
				var bm2:BitmapData = new bg7().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			else if (id == 9)
			{
				var bm2:BitmapData = new bg8().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			else if (id == 10)
			{
				var bm2:BitmapData = new bg9().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			else if (id == 11)
			{
				var bm2:BitmapData = new bg10().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			else if (id == 12)
			{
				var bm2:BitmapData = new bg11().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			else if (id == 13)
			{
				var bm2:BitmapData = new bg12().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			else if (id == 14)
			{
				var bm2:BitmapData = new bg13().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			else if (id == 15)
			{
				var bm2:BitmapData = new bg14().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			else if (id == 16)
			{
				var bm2:BitmapData = new bg15().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			else if (id == 17)
			{
				var bm2:BitmapData = new bg16().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			else if (id == 18)
			{
				var bm2:BitmapData = new bg17().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			else if (id == 19)
			{
				var bm2:BitmapData = new bg18().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
			else if (id == 20)
			{
				var bm2:BitmapData = new bg19().bitmapData;
				var earthMaterial1:BitmapTexture = Cast.bitmapTexture(bm2);
				var earthMaterial:TextureMaterial = new TextureMaterial(earthMaterial1);
				var _ground:Mesh = new Mesh(new SphereGeometry(500,100,45), earthMaterial);
				_parent = new ObjectContainer3D();
				_parent1 = new ObjectContainer3D();
				_parent.x = 0;
				_parent.y = -450;
				_parent1.x = 0;
				_parent1.y = -350;
				_balls = new ObjectContainer3D();
				_parent.addChild(_parent1);
				_parent.addChild(_balls);
				_balls.addChild(_ground);
				view.scene.addChild(_parent);
			}
		
		}
		
		private function buttonClick1(event:Event):void
		{
			
			var stream:FileStream = new FileStream();
			newrotation = 0;
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			//Write to the file time and dataset opened
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"BlueMarble"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			view.dispose();
			var newid:String = String(1);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			//Loads the bit map for the background
			var bmd:BitmapData = new bac1().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(1);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
			if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		}
		
		//The working of button click 2 to button click 20 is similar to button click 1.
		private function buttonClick2(event:MouseEvent):void
		{
			var stream:FileStream = new FileStream();
			newrotation = 0;
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"Air Traffic"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			
			view.dispose();
			var newid:String = String(2);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac2().bitmapData;
			view.background = new BitmapTexture(bmd);
			
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(2);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
			if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		
		}
		
		private function buttonClick3(event:MouseEvent):void
		{
			var stream:FileStream = new FileStream();
			newrotation = 0;
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"Food vs Feed"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			view.dispose();
			var newid:String = String(3);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac3().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(3);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
		if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		}
		
		private function buttonClick4(event:MouseEvent):void
		{
			var stream:FileStream = new FileStream();
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"Global Vegetation"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			view.dispose();
			var newid:String = String(4);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac4().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(4);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
		if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		}
		
		private function buttonClick5(event:MouseEvent):void
		{
			var stream:FileStream = new FileStream();
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"Hurricane Tracks"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			view.dispose();
			var newid:String = String(5);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac5().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(5);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
			if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		}
		
		private function buttonClick6(event:MouseEvent):void
		{
			var stream:FileStream = new FileStream();
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"Magnetic Declination"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			view.dispose();
			var newid:String = String(6);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac6().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(6);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
			if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		
		}
		
		private function buttonClick7(event:MouseEvent):void
		{
		var stream:FileStream = new FileStream();
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"Nasa Sea Currents"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			view.dispose();
			var newid:String = String(7);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac7().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(7);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
			if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		
		}
		
		private function buttonClick8(event:MouseEvent):void
		{
			var stream:FileStream = new FileStream();
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"The Wanders"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			
			view.dispose();
			var newid:String = String(8);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac8().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(8);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
			if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		
		}
		
		private function buttonClick9(event:MouseEvent):void
		{
			var stream:FileStream = new FileStream();
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"Aerosol Black Carbon"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
		
			view.dispose();
			var newid:String = String(9);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac9().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(9);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
			if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		
		}
		
		private function buttonClick10(event:MouseEvent):void
		{
			var stream:FileStream = new FileStream();
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"Iu Photography"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			
			view.dispose();
			var newid:String = String(10);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac10().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(10);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
			if (auxDisplay == "sos")
			{
				
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		
		}
		
		private function buttonClick11(event:MouseEvent):void
		{
			var stream:FileStream = new FileStream();
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"The Eye"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			
			view.dispose();
			var newid:String = String(11);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac11().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(11);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
			if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		
		}
		
		private function buttonClick12(event:MouseEvent):void
		{
			var stream:FileStream = new FileStream();
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"Future Paleo"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			view.dispose();
			var newid:String = String(12);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac12().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(12);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
			if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		
		}
		
		private function buttonClick13(event:MouseEvent):void
		{
			var stream:FileStream = new FileStream();
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"Mandel Brot Fractels"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			view.dispose();
			var newid:String = String(13);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac13().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(13);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
			if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		
		}
		
		private function buttonClick14(event:MouseEvent):void
		{
			var stream:FileStream = new FileStream();
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"Cook Medical Shipments"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			view.dispose();
			var newid:String = String(14);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac14().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(14);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
			if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		
		}
		
		private function buttonClick15(event:MouseEvent):void
		{
			var stream:FileStream = new FileStream();
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"Death Star"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			view.dispose();
			var newid:String = String(15);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac15().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(15);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
			if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		
		}
		
		private function buttonClick16(event:MouseEvent):void
		{
			var stream:FileStream = new FileStream();
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"World Cup Appearances"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			view.dispose();
			var newid:String = String(16);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac16().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(16);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
			if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		
		}
		
		private function buttonClick17(event:MouseEvent):void
		{
			var stream:FileStream = new FileStream();
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"Winter Olympics"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			view.dispose();
			var newid:String = String(17);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac17().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(17);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
			if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		
		}
		
		private function buttonClick18(event:MouseEvent):void
		{
			var stream:FileStream = new FileStream();
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"Facebook"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			view.dispose();
			var newid:String = String(18);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac18().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(18);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
			if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		
		}
		
		private function buttonClick19(event:MouseEvent):void
		{
			var stream:FileStream = new FileStream();
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"Operation Iceberg"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			view.dispose();
			var newid:String = String(19);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac19().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(19);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
			if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		
		}
		
		private function buttonClick20(event:MouseEvent):void
		{
			
			var stream:FileStream = new FileStream();
			var hours:Number = date.hours;
			var minutes:Number = date.minutes;
			var seconds:Number = date.seconds;
			var day:Number = date.date;
			var month:Number = date.month;
			var year:Number = date.fullYear;
			month = month + 1;
			stream.open(file, FileMode.APPEND);
			stream.writeUTFBytes(year+":"+month+":"+date+"  "+"Best20.sos"+"   "+"Evolution Of Moon"+"  "+hours+":"+minutes+":"+seconds+"\r\n")
			stream.close();
			view.dispose();
			var newid:String = String(20);
			view = new View3D();
			view.backgroundColor = 0x0;
			view.antiAlias = 4;
			view.camera.lookAt(new Vector3D());
			var bmd:BitmapData = new bac20().bitmapData;
			view.background = new BitmapTexture(bmd);
			addChild(view);
			//Create the Buttons
			createButton();
			createScene(20);
			var ba:ByteArray = new ByteArray();
			var auxDisplay:String = CMLParser.cmlData.attribute("auxDisplay");
			trace(auxDisplay);
			
			if (auxDisplay == "sos")
			{
				var playlist:String = CMLParser.cmlData.attribute("playlist");
				
				// make sure autorun is disabled
				ba.writeMultiByte("set_auto_presentation_mode 0\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				// make sure the correct playlist is active
				ba.writeMultiByte("open_playlist " + playlist + "\n", "UTF-8");
				_telnetClient.writeBytesToSocket(ba);
				ba.clear();
				
				// play the clip
				ba.writeMultiByte("play " + newid + "\n", "UTF-8");
			}
			else if (auxDisplay == "sosEmulator")
			{
				ba.writeMultiByte(newid, "UTF-8"); // emulator requires id alone
			}
			
			_telnetClient.writeBytesToSocket(ba);
			_idleTimer.reset();
			_idleTimer.start();
		
		}
		
		private function loop(event:Event):void
		{
			
			// Render the 3D scene
			view.render();
		}
		
		/**
		 * Show error popup with description.
		 * @param	message
		 */
		private function errorPopup(message:String):void
		{
			var error:Container = CMLObjectList.instance.getId("error");
			var errorDescription:Text = CMLObjectList.instance.getId("error_description");
			
			errorDescription.text += message;
			sendToTop(error);
			error.visible = true;
		}
		
		/**
		 *
		 *
		 * Utility Functions
		 *
		 */
		
		/**
		 * Send the object to the top of its container
		 * @param	object
		 */
		private function sendToTop(object:*):void
		{
			object.parent.setChildIndex(object, object.parent.numChildren - 1);
		}
		
		/**
		 * Send the object to the bottom of its container
		 * @param	object
		 */
		private function sendToBottom(object:*):void
		{
			object.parent.setChildIndex(object, 0);
		}
		
		/**
		 * Sets the registration point of a display object to a point other than (0,0)
		 * modified from http://theflashconnection.com/content/how-to-change-registration-point-as3
		 * @param	obj
		 * @param	newX
		 * @param	newY
		 */
		private function setRegPoint(obj:DisplayObjectContainer, newX:Number, newY:Number):void
		{
			//get the bounds of the object and the location 
			//of the current registration point in relation
			//to the upper left corner of the graphical content
			//note: this is a PSEUDO currentRegX and currentRegY, as the 
			//registration point of a display object is ALWAYS (0, 0):
			var bounds:Rectangle = obj.getBounds(obj.parent);
			var currentRegX:Number = obj.x - bounds.left;
			var currentRegY:Number = obj.y - bounds.top;
			var scale:Number = obj.scaleX; // assume object is scaled uniformly
			
			var xOffset:Number = newX - currentRegX;
			var yOffset:Number = newY - currentRegY;
			//shift the object to its new location--
			//this will put it back in the same position
			//where it started (that is, VISUALLY anyway):
			obj.x += xOffset;
			obj.y += yOffset;
			
			//shift all the children the same amount,
			//but in the opposite direction
			for (var i:int = 0; i < obj.numChildren; i++)
			{
				//obj.getChildAt(i).x -= xOffset;
				//obj.getChildAt(i).y -= yOffset;
				obj.getChildAt(i).x -= xOffset / scale;
				obj.getChildAt(i).y -= yOffset / scale;
			}
		}
	
	}
}
