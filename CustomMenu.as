package org.application{

import flash.display.Sprite;
import flash.display.StageDisplayState;
import flash.events.ContextMenuEvent;
import flash.ui.ContextMenu;
import flash.ui.ContextMenuItem;
import flash.net.URLRequest;
import flash.net.navigateToURL;

public dynamic class CustomMenu extends Sprite{;

public static var cm:ContextMenu = new ContextMenu;
public static var year:Date=new Date;

public static var menuItem1:ContextMenuItem=new ContextMenuItem("Go Fullscreen");
public static var menuItem2:ContextMenuItem=new ContextMenuItem("Exit Fullscreen");
public static var menuItem3:ContextMenuItem=new ContextMenuItem(year.getFullYear() + Global.data._company_website);

public static function goToSite(event:ContextMenuEvent):void {
var url:URLRequest = new URLRequest("http://"+Global.data._company_website);
navigateToURL(url,"_blank");
}

public static function goFullScreen(event:ContextMenuEvent):void {
Global.data._game.stage.displayState = StageDisplayState.FULL_SCREEN;
menuItem1.enabled = false;
menuItem2.enabled = true;
}

public static function exitFullScreen(event:ContextMenuEvent):void {
Global.data._game.stage.displayState = StageDisplayState.NORMAL;
menuItem1.enabled = true;
menuItem2.enabled = false;
}
public static function buildMenu(stage:Object):CustomMenu {
//trace("RIGHT CLICK MENU ENABLED");

var self:CustomMenu = new CustomMenu;

menuItem2.enabled=false;
menuItem3.separatorBefore=true;
menuItem3.enabled=false;

menuItem1.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, goFullScreen);
menuItem2.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,exitFullScreen);
menuItem3.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, goToSite);

cm.hideBuiltInItems();
cm.customItems.push(menuItem1,menuItem2,menuItem3);
Global.data._game.contextMenu=cm;

return self;
}
}
}
