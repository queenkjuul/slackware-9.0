#!/bin/sh
# This script is invoked when installing manual entries.  It generates
# additional links to manual entries, corresponding to the procedure
# and command names described by the manual entry.  For example, the
# Tcl manual entry Hash.3.gz describes procedures Tcl_InitHashTable,
# Tcl_CreateHashEntry, and many more.  This script will make hard
# links so that Tcl_InitHashTable.3.gz, Tcl_CreateHashEntry.3.gz, and so
# on all refer to Hash.3.gz in the installed directory.
#
# Because of the length of command and procedure names, this mechanism
# only works on machines that support file names longer than 14 characters.
# This script checks to see if long file names are supported, and it
# doesn't make any links if they are not.
#
# The script takes one argument, which is the name of the directory
# where the manual entries have been installed.

ZIP=true
while true; do
    case $1 in
        -s | --symlinks )
            S=-s
            ;;
        -z | --compress )
            ZIP=$2
            shift
            ;;
        *) break
            ;;
    esac
    shift
done

if test $# != 1; then
    echo "Usage: mkLinks <options> dir"
    exit 1
fi

if test "x$ZIP" != "xtrue"; then
    touch TeST
    $ZIP TeST
    Z=`ls TeST* | sed 's/^[^.]*//'`
    rm -f TeST*
fi

cd $1
echo foo > xyzzyTestingAVeryLongFileName.foo
x=`echo xyzzyTe*`
echo foo > xyzzyTestingaverylongfilename.foo
y=`echo xyzzyTestingav*`
rm xyzzyTe*
if test "$x" != "xyzzyTestingAVeryLongFileName.foo"; then
    exit
fi
if test "$y" != "xyzzyTestingaverylongfilename.foo"; then
    CASEINSENSITIVEFS=1
fi

if test -r 3DBorder.3.gz; then
    rm -f 3DBorder.3.gz.*
    $ZIP 3DBorder.3.gz
    rm -f Tk_Alloc3DBorderFromObj.3.gz Tk_Alloc3DBorderFromObj.3.gz.* 
    rm -f Tk_Get3DBorder.3.gz Tk_Get3DBorder.3.gz.* 
    rm -f Tk_Get3DBorderFromObj.3.gz Tk_Get3DBorderFromObj.3.gz.* 
    rm -f Tk_Draw3DRectangle.3.gz Tk_Draw3DRectangle.3.gz.* 
    rm -f Tk_Fill3DRectangle.3.gz Tk_Fill3DRectangle.3.gz.* 
    rm -f Tk_Draw3DPolygon.3.gz Tk_Draw3DPolygon.3.gz.* 
    rm -f Tk_Fill3DPolygon.3.gz Tk_Fill3DPolygon.3.gz.* 
    rm -f Tk_3DVerticalBevel.3.gz Tk_3DVerticalBevel.3.gz.* 
    rm -f Tk_3DHorizontalBevel.3.gz Tk_3DHorizontalBevel.3.gz.* 
    rm -f Tk_SetBackgroundFromBorder.3.gz Tk_SetBackgroundFromBorder.3.gz.* 
    rm -f Tk_NameOf3DBorder.3.gz Tk_NameOf3DBorder.3.gz.* 
    rm -f Tk_3DBorderColor.3.gz Tk_3DBorderColor.3.gz.* 
    rm -f Tk_3DBorderGC.3.gz Tk_3DBorderGC.3.gz.* 
    rm -f Tk_Free3DBorderFromObj.3.gz Tk_Free3DBorderFromObj.3.gz.* 
    rm -f Tk_Free3DBorder.3.gz Tk_Free3DBorder.3.gz.* 
    ln -sf $S 3DBorder.3.gz$Z Tk_Alloc3DBorderFromObj.3.gz$Z 
    ln -sf $S 3DBorder.3.gz$Z Tk_Get3DBorder.3.gz$Z 
    ln -sf $S 3DBorder.3.gz$Z Tk_Get3DBorderFromObj.3.gz$Z 
    ln -sf $S 3DBorder.3.gz$Z Tk_Draw3DRectangle.3.gz$Z 
    ln -sf $S 3DBorder.3.gz$Z Tk_Fill3DRectangle.3.gz$Z 
    ln -sf $S 3DBorder.3.gz$Z Tk_Draw3DPolygon.3.gz$Z 
    ln -sf $S 3DBorder.3.gz$Z Tk_Fill3DPolygon.3.gz$Z 
    ln -sf $S 3DBorder.3.gz$Z Tk_3DVerticalBevel.3.gz$Z 
    ln -sf $S 3DBorder.3.gz$Z Tk_3DHorizontalBevel.3.gz$Z 
    ln -sf $S 3DBorder.3.gz$Z Tk_SetBackgroundFromBorder.3.gz$Z 
    ln -sf $S 3DBorder.3.gz$Z Tk_NameOf3DBorder.3.gz$Z 
    ln -sf $S 3DBorder.3.gz$Z Tk_3DBorderColor.3.gz$Z 
    ln -sf $S 3DBorder.3.gz$Z Tk_3DBorderGC.3.gz$Z 
    ln -sf $S 3DBorder.3.gz$Z Tk_Free3DBorderFromObj.3.gz$Z 
    ln -sf $S 3DBorder.3.gz$Z Tk_Free3DBorder.3.gz$Z 
fi
if test -r AddOption.3.gz; then
    rm -f AddOption.3.gz.*
    $ZIP AddOption.3.gz
    rm -f Tk_AddOption.3.gz Tk_AddOption.3.gz.* 
    ln -sf $S AddOption.3.gz$Z Tk_AddOption.3.gz$Z 
fi
if test -r BindTable.3.gz; then
    rm -f BindTable.3.gz.*
    $ZIP BindTable.3.gz
    rm -f Tk_CreateBindingTable.3.gz Tk_CreateBindingTable.3.gz.* 
    rm -f Tk_DeleteBindingTable.3.gz Tk_DeleteBindingTable.3.gz.* 
    rm -f Tk_CreateBinding.3.gz Tk_CreateBinding.3.gz.* 
    rm -f Tk_DeleteBinding.3.gz Tk_DeleteBinding.3.gz.* 
    rm -f Tk_GetBinding.3.gz Tk_GetBinding.3.gz.* 
    rm -f Tk_GetAllBindings.3.gz Tk_GetAllBindings.3.gz.* 
    rm -f Tk_DeleteAllBindings.3.gz Tk_DeleteAllBindings.3.gz.* 
    rm -f Tk_BindEvent.3.gz Tk_BindEvent.3.gz.* 
    ln -sf $S BindTable.3.gz$Z Tk_CreateBindingTable.3.gz$Z 
    ln -sf $S BindTable.3.gz$Z Tk_DeleteBindingTable.3.gz$Z 
    ln -sf $S BindTable.3.gz$Z Tk_CreateBinding.3.gz$Z 
    ln -sf $S BindTable.3.gz$Z Tk_DeleteBinding.3.gz$Z 
    ln -sf $S BindTable.3.gz$Z Tk_GetBinding.3.gz$Z 
    ln -sf $S BindTable.3.gz$Z Tk_GetAllBindings.3.gz$Z 
    ln -sf $S BindTable.3.gz$Z Tk_DeleteAllBindings.3.gz$Z 
    ln -sf $S BindTable.3.gz$Z Tk_BindEvent.3.gz$Z 
fi
if test -r CanvPsY.3.gz; then
    rm -f CanvPsY.3.gz.*
    $ZIP CanvPsY.3.gz
    rm -f Tk_CanvasPsY.3.gz Tk_CanvasPsY.3.gz.* 
    rm -f Tk_CanvasPsBitmap.3.gz Tk_CanvasPsBitmap.3.gz.* 
    rm -f Tk_CanvasPsColor.3.gz Tk_CanvasPsColor.3.gz.* 
    rm -f Tk_CanvasPsFont.3.gz Tk_CanvasPsFont.3.gz.* 
    rm -f Tk_CanvasPsPath.3.gz Tk_CanvasPsPath.3.gz.* 
    rm -f Tk_CanvasPsStipple.3.gz Tk_CanvasPsStipple.3.gz.* 
    ln -sf $S CanvPsY.3.gz$Z Tk_CanvasPsY.3.gz$Z 
    ln -sf $S CanvPsY.3.gz$Z Tk_CanvasPsBitmap.3.gz$Z 
    ln -sf $S CanvPsY.3.gz$Z Tk_CanvasPsColor.3.gz$Z 
    ln -sf $S CanvPsY.3.gz$Z Tk_CanvasPsFont.3.gz$Z 
    ln -sf $S CanvPsY.3.gz$Z Tk_CanvasPsPath.3.gz$Z 
    ln -sf $S CanvPsY.3.gz$Z Tk_CanvasPsStipple.3.gz$Z 
fi
if test -r CanvTkwin.3.gz; then
    rm -f CanvTkwin.3.gz.*
    $ZIP CanvTkwin.3.gz
    rm -f Tk_CanvasTkwin.3.gz Tk_CanvasTkwin.3.gz.* 
    rm -f Tk_CanvasGetCoord.3.gz Tk_CanvasGetCoord.3.gz.* 
    rm -f Tk_CanvasDrawableCoords.3.gz Tk_CanvasDrawableCoords.3.gz.* 
    rm -f Tk_CanvasSetStippleOrigin.3.gz Tk_CanvasSetStippleOrigin.3.gz.* 
    rm -f Tk_CanvasWindowCoords.3.gz Tk_CanvasWindowCoords.3.gz.* 
    rm -f Tk_CanvasEventuallyRedraw.3.gz Tk_CanvasEventuallyRedraw.3.gz.* 
    rm -f Tk_CanvasTagsOption.3.gz Tk_CanvasTagsOption.3.gz.* 
    ln -sf $S CanvTkwin.3.gz$Z Tk_CanvasTkwin.3.gz$Z 
    ln -sf $S CanvTkwin.3.gz$Z Tk_CanvasGetCoord.3.gz$Z 
    ln -sf $S CanvTkwin.3.gz$Z Tk_CanvasDrawableCoords.3.gz$Z 
    ln -sf $S CanvTkwin.3.gz$Z Tk_CanvasSetStippleOrigin.3.gz$Z 
    ln -sf $S CanvTkwin.3.gz$Z Tk_CanvasWindowCoords.3.gz$Z 
    ln -sf $S CanvTkwin.3.gz$Z Tk_CanvasEventuallyRedraw.3.gz$Z 
    ln -sf $S CanvTkwin.3.gz$Z Tk_CanvasTagsOption.3.gz$Z 
fi
if test -r CanvTxtInfo.3.gz; then
    rm -f CanvTxtInfo.3.gz.*
    $ZIP CanvTxtInfo.3.gz
    rm -f Tk_CanvasTextInfo.3.gz Tk_CanvasTextInfo.3.gz.* 
    ln -sf $S CanvTxtInfo.3.gz$Z Tk_CanvasTextInfo.3.gz$Z 
fi
if test -r Clipboard.3.gz; then
    rm -f Clipboard.3.gz.*
    $ZIP Clipboard.3.gz
    rm -f Tk_ClipboardClear.3.gz Tk_ClipboardClear.3.gz.* 
    rm -f Tk_ClipboardAppend.3.gz Tk_ClipboardAppend.3.gz.* 
    ln -sf $S Clipboard.3.gz$Z Tk_ClipboardClear.3.gz$Z 
    ln -sf $S Clipboard.3.gz$Z Tk_ClipboardAppend.3.gz$Z 
fi
if test -r ClrSelect.3.gz; then
    rm -f ClrSelect.3.gz.*
    $ZIP ClrSelect.3.gz
    rm -f Tk_ClearSelection.3.gz Tk_ClearSelection.3.gz.* 
    ln -sf $S ClrSelect.3.gz$Z Tk_ClearSelection.3.gz$Z 
fi
if test -r ConfigWidg.3.gz; then
    rm -f ConfigWidg.3.gz.*
    $ZIP ConfigWidg.3.gz
    rm -f Tk_ConfigureWidget.3.gz Tk_ConfigureWidget.3.gz.* 
    rm -f Tk_Offset.3.gz Tk_Offset.3.gz.* 
    rm -f Tk_ConfigureInfo.3.gz Tk_ConfigureInfo.3.gz.* 
    rm -f Tk_ConfigureValue.3.gz Tk_ConfigureValue.3.gz.* 
    rm -f Tk_FreeOptions.3.gz Tk_FreeOptions.3.gz.* 
    ln -sf $S ConfigWidg.3.gz$Z Tk_ConfigureWidget.3.gz$Z 
    ln -sf $S ConfigWidg.3.gz$Z Tk_Offset.3.gz$Z 
    ln -sf $S ConfigWidg.3.gz$Z Tk_ConfigureInfo.3.gz$Z 
    ln -sf $S ConfigWidg.3.gz$Z Tk_ConfigureValue.3.gz$Z 
    ln -sf $S ConfigWidg.3.gz$Z Tk_FreeOptions.3.gz$Z 
fi
if test -r ConfigWind.3.gz; then
    rm -f ConfigWind.3.gz.*
    $ZIP ConfigWind.3.gz
    rm -f Tk_ConfigureWindow.3.gz Tk_ConfigureWindow.3.gz.* 
    rm -f Tk_MoveWindow.3.gz Tk_MoveWindow.3.gz.* 
    rm -f Tk_ResizeWindow.3.gz Tk_ResizeWindow.3.gz.* 
    rm -f Tk_MoveResizeWindow.3.gz Tk_MoveResizeWindow.3.gz.* 
    rm -f Tk_SetWindowBorderWidth.3.gz Tk_SetWindowBorderWidth.3.gz.* 
    rm -f Tk_ChangeWindowAttributes.3.gz Tk_ChangeWindowAttributes.3.gz.* 
    rm -f Tk_SetWindowBackground.3.gz Tk_SetWindowBackground.3.gz.* 
    rm -f Tk_SetWindowBackgroundPixmap.3.gz Tk_SetWindowBackgroundPixmap.3.gz.* 
    rm -f Tk_SetWindowBorder.3.gz Tk_SetWindowBorder.3.gz.* 
    rm -f Tk_SetWindowBorderPixmap.3.gz Tk_SetWindowBorderPixmap.3.gz.* 
    rm -f Tk_SetWindowColormap.3.gz Tk_SetWindowColormap.3.gz.* 
    rm -f Tk_DefineCursor.3.gz Tk_DefineCursor.3.gz.* 
    rm -f Tk_UndefineCursor.3.gz Tk_UndefineCursor.3.gz.* 
    ln -sf $S ConfigWind.3.gz$Z Tk_ConfigureWindow.3.gz$Z 
    ln -sf $S ConfigWind.3.gz$Z Tk_MoveWindow.3.gz$Z 
    ln -sf $S ConfigWind.3.gz$Z Tk_ResizeWindow.3.gz$Z 
    ln -sf $S ConfigWind.3.gz$Z Tk_MoveResizeWindow.3.gz$Z 
    ln -sf $S ConfigWind.3.gz$Z Tk_SetWindowBorderWidth.3.gz$Z 
    ln -sf $S ConfigWind.3.gz$Z Tk_ChangeWindowAttributes.3.gz$Z 
    ln -sf $S ConfigWind.3.gz$Z Tk_SetWindowBackground.3.gz$Z 
    ln -sf $S ConfigWind.3.gz$Z Tk_SetWindowBackgroundPixmap.3.gz$Z 
    ln -sf $S ConfigWind.3.gz$Z Tk_SetWindowBorder.3.gz$Z 
    ln -sf $S ConfigWind.3.gz$Z Tk_SetWindowBorderPixmap.3.gz$Z 
    ln -sf $S ConfigWind.3.gz$Z Tk_SetWindowColormap.3.gz$Z 
    ln -sf $S ConfigWind.3.gz$Z Tk_DefineCursor.3.gz$Z 
    ln -sf $S ConfigWind.3.gz$Z Tk_UndefineCursor.3.gz$Z 
fi
if test -r CoordToWin.3.gz; then
    rm -f CoordToWin.3.gz.*
    $ZIP CoordToWin.3.gz
    rm -f Tk_CoordsToWindow.3.gz Tk_CoordsToWindow.3.gz.* 
    ln -sf $S CoordToWin.3.gz$Z Tk_CoordsToWindow.3.gz$Z 
fi
if test -r CrtCmHdlr.3.gz; then
    rm -f CrtCmHdlr.3.gz.*
    $ZIP CrtCmHdlr.3.gz
    rm -f Tk_CreateClientMessageHandler.3.gz Tk_CreateClientMessageHandler.3.gz.* 
    rm -f Tk_DeleteClientMessageHandler.3.gz Tk_DeleteClientMessageHandler.3.gz.* 
    ln -sf $S CrtCmHdlr.3.gz$Z Tk_CreateClientMessageHandler.3.gz$Z 
    ln -sf $S CrtCmHdlr.3.gz$Z Tk_DeleteClientMessageHandler.3.gz$Z 
fi
if test -r CrtErrHdlr.3.gz; then
    rm -f CrtErrHdlr.3.gz.*
    $ZIP CrtErrHdlr.3.gz
    rm -f Tk_CreateErrorHandler.3.gz Tk_CreateErrorHandler.3.gz.* 
    rm -f Tk_DeleteErrorHandler.3.gz Tk_DeleteErrorHandler.3.gz.* 
    ln -sf $S CrtErrHdlr.3.gz$Z Tk_CreateErrorHandler.3.gz$Z 
    ln -sf $S CrtErrHdlr.3.gz$Z Tk_DeleteErrorHandler.3.gz$Z 
fi
if test -r CrtGenHdlr.3.gz; then
    rm -f CrtGenHdlr.3.gz.*
    $ZIP CrtGenHdlr.3.gz
    rm -f Tk_CreateGenericHandler.3.gz Tk_CreateGenericHandler.3.gz.* 
    rm -f Tk_DeleteGenericHandler.3.gz Tk_DeleteGenericHandler.3.gz.* 
    ln -sf $S CrtGenHdlr.3.gz$Z Tk_CreateGenericHandler.3.gz$Z 
    ln -sf $S CrtGenHdlr.3.gz$Z Tk_DeleteGenericHandler.3.gz$Z 
fi
if test -r CrtImgType.3.gz; then
    rm -f CrtImgType.3.gz.*
    $ZIP CrtImgType.3.gz
    rm -f Tk_CreateImageType.3.gz Tk_CreateImageType.3.gz.* 
    rm -f Tk_GetImageMasterData.3.gz Tk_GetImageMasterData.3.gz.* 
    rm -f Tk_InitImageArgs.3.gz Tk_InitImageArgs.3.gz.* 
    ln -sf $S CrtImgType.3.gz$Z Tk_CreateImageType.3.gz$Z 
    ln -sf $S CrtImgType.3.gz$Z Tk_GetImageMasterData.3.gz$Z 
    ln -sf $S CrtImgType.3.gz$Z Tk_InitImageArgs.3.gz$Z 
fi
if test -r CrtItemType.3.gz; then
    rm -f CrtItemType.3.gz.*
    $ZIP CrtItemType.3.gz
    rm -f Tk_CreateItemType.3.gz Tk_CreateItemType.3.gz.* 
    rm -f Tk_GetItemTypes.3.gz Tk_GetItemTypes.3.gz.* 
    ln -sf $S CrtItemType.3.gz$Z Tk_CreateItemType.3.gz$Z 
    ln -sf $S CrtItemType.3.gz$Z Tk_GetItemTypes.3.gz$Z 
fi
if test -r CrtPhImgFmt.3.gz; then
    rm -f CrtPhImgFmt.3.gz.*
    $ZIP CrtPhImgFmt.3.gz
    rm -f Tk_CreatePhotoImageFormat.3.gz Tk_CreatePhotoImageFormat.3.gz.* 
    ln -sf $S CrtPhImgFmt.3.gz$Z Tk_CreatePhotoImageFormat.3.gz$Z 
fi
if test -r CrtSelHdlr.3.gz; then
    rm -f CrtSelHdlr.3.gz.*
    $ZIP CrtSelHdlr.3.gz
    rm -f Tk_CreateSelHandler.3.gz Tk_CreateSelHandler.3.gz.* 
    rm -f Tk_DeleteSelHandler.3.gz Tk_DeleteSelHandler.3.gz.* 
    ln -sf $S CrtSelHdlr.3.gz$Z Tk_CreateSelHandler.3.gz$Z 
    ln -sf $S CrtSelHdlr.3.gz$Z Tk_DeleteSelHandler.3.gz$Z 
fi
if test -r CrtWindow.3.gz; then
    rm -f CrtWindow.3.gz.*
    $ZIP CrtWindow.3.gz
    rm -f Tk_CreateWindow.3.gz Tk_CreateWindow.3.gz.* 
    rm -f Tk_CreateWindowFromPath.3.gz Tk_CreateWindowFromPath.3.gz.* 
    rm -f Tk_DestroyWindow.3.gz Tk_DestroyWindow.3.gz.* 
    rm -f Tk_MakeWindowExist.3.gz Tk_MakeWindowExist.3.gz.* 
    ln -sf $S CrtWindow.3.gz$Z Tk_CreateWindow.3.gz$Z 
    ln -sf $S CrtWindow.3.gz$Z Tk_CreateWindowFromPath.3.gz$Z 
    ln -sf $S CrtWindow.3.gz$Z Tk_DestroyWindow.3.gz$Z 
    ln -sf $S CrtWindow.3.gz$Z Tk_MakeWindowExist.3.gz$Z 
fi
if test -r DeleteImg.3.gz; then
    rm -f DeleteImg.3.gz.*
    $ZIP DeleteImg.3.gz
    rm -f Tk_DeleteImage.3.gz Tk_DeleteImage.3.gz.* 
    ln -sf $S DeleteImg.3.gz$Z Tk_DeleteImage.3.gz$Z 
fi
if test -r DrawFocHlt.3.gz; then
    rm -f DrawFocHlt.3.gz.*
    $ZIP DrawFocHlt.3.gz
    rm -f Tk_DrawFocusHighlight.3.gz Tk_DrawFocusHighlight.3.gz.* 
    ln -sf $S DrawFocHlt.3.gz$Z Tk_DrawFocusHighlight.3.gz$Z 
fi
if test -r EventHndlr.3.gz; then
    rm -f EventHndlr.3.gz.*
    $ZIP EventHndlr.3.gz
    rm -f Tk_CreateEventHandler.3.gz Tk_CreateEventHandler.3.gz.* 
    rm -f Tk_DeleteEventHandler.3.gz Tk_DeleteEventHandler.3.gz.* 
    ln -sf $S EventHndlr.3.gz$Z Tk_CreateEventHandler.3.gz$Z 
    ln -sf $S EventHndlr.3.gz$Z Tk_DeleteEventHandler.3.gz$Z 
fi
if test -r FindPhoto.3.gz; then
    rm -f FindPhoto.3.gz.*
    $ZIP FindPhoto.3.gz
    rm -f Tk_FindPhoto.3.gz Tk_FindPhoto.3.gz.* 
    rm -f Tk_PhotoPutBlock.3.gz Tk_PhotoPutBlock.3.gz.* 
    rm -f Tk_PhotoPutZoomedBlock.3.gz Tk_PhotoPutZoomedBlock.3.gz.* 
    rm -f Tk_PhotoGetImage.3.gz Tk_PhotoGetImage.3.gz.* 
    rm -f Tk_PhotoBlank.3.gz Tk_PhotoBlank.3.gz.* 
    rm -f Tk_PhotoExpand.3.gz Tk_PhotoExpand.3.gz.* 
    rm -f Tk_PhotoGetSize.3.gz Tk_PhotoGetSize.3.gz.* 
    rm -f Tk_PhotoSetSize.3.gz Tk_PhotoSetSize.3.gz.* 
    ln -sf $S FindPhoto.3.gz$Z Tk_FindPhoto.3.gz$Z 
    ln -sf $S FindPhoto.3.gz$Z Tk_PhotoPutBlock.3.gz$Z 
    ln -sf $S FindPhoto.3.gz$Z Tk_PhotoPutZoomedBlock.3.gz$Z 
    ln -sf $S FindPhoto.3.gz$Z Tk_PhotoGetImage.3.gz$Z 
    ln -sf $S FindPhoto.3.gz$Z Tk_PhotoBlank.3.gz$Z 
    ln -sf $S FindPhoto.3.gz$Z Tk_PhotoExpand.3.gz$Z 
    ln -sf $S FindPhoto.3.gz$Z Tk_PhotoGetSize.3.gz$Z 
    ln -sf $S FindPhoto.3.gz$Z Tk_PhotoSetSize.3.gz$Z 
fi
if test -r FontId.3.gz; then
    rm -f FontId.3.gz.*
    $ZIP FontId.3.gz
    rm -f Tk_FontId.3.gz Tk_FontId.3.gz.* 
    rm -f Tk_GetFontMetrics.3.gz Tk_GetFontMetrics.3.gz.* 
    rm -f Tk_PostscriptFontName.3.gz Tk_PostscriptFontName.3.gz.* 
    ln -sf $S FontId.3.gz$Z Tk_FontId.3.gz$Z 
    ln -sf $S FontId.3.gz$Z Tk_GetFontMetrics.3.gz$Z 
    ln -sf $S FontId.3.gz$Z Tk_PostscriptFontName.3.gz$Z 
fi
if test -r FreeXId.3.gz; then
    rm -f FreeXId.3.gz.*
    $ZIP FreeXId.3.gz
    rm -f Tk_FreeXId.3.gz Tk_FreeXId.3.gz.* 
    ln -sf $S FreeXId.3.gz$Z Tk_FreeXId.3.gz$Z 
fi
if test -r GeomReq.3.gz; then
    rm -f GeomReq.3.gz.*
    $ZIP GeomReq.3.gz
    rm -f Tk_GeometryRequest.3.gz Tk_GeometryRequest.3.gz.* 
    rm -f Tk_SetMinimumRequestSize.3.gz Tk_SetMinimumRequestSize.3.gz.* 
    rm -f Tk_SetInternalBorder.3.gz Tk_SetInternalBorder.3.gz.* 
    rm -f Tk_SetInternalBorderEx.3.gz Tk_SetInternalBorderEx.3.gz.* 
    ln -sf $S GeomReq.3.gz$Z Tk_GeometryRequest.3.gz$Z 
    ln -sf $S GeomReq.3.gz$Z Tk_SetMinimumRequestSize.3.gz$Z 
    ln -sf $S GeomReq.3.gz$Z Tk_SetInternalBorder.3.gz$Z 
    ln -sf $S GeomReq.3.gz$Z Tk_SetInternalBorderEx.3.gz$Z 
fi
if test -r GetAnchor.3.gz; then
    rm -f GetAnchor.3.gz.*
    $ZIP GetAnchor.3.gz
    rm -f Tk_GetAnchorFromObj.3.gz Tk_GetAnchorFromObj.3.gz.* 
    rm -f Tk_GetAnchor.3.gz Tk_GetAnchor.3.gz.* 
    rm -f Tk_NameOfAnchor.3.gz Tk_NameOfAnchor.3.gz.* 
    ln -sf $S GetAnchor.3.gz$Z Tk_GetAnchorFromObj.3.gz$Z 
    ln -sf $S GetAnchor.3.gz$Z Tk_GetAnchor.3.gz$Z 
    ln -sf $S GetAnchor.3.gz$Z Tk_NameOfAnchor.3.gz$Z 
fi
if test -r GetBitmap.3.gz; then
    rm -f GetBitmap.3.gz.*
    $ZIP GetBitmap.3.gz
    rm -f Tk_AllocBitmapFromObj.3.gz Tk_AllocBitmapFromObj.3.gz.* 
    rm -f Tk_GetBitmap.3.gz Tk_GetBitmap.3.gz.* 
    rm -f Tk_GetBitmapFromObj.3.gz Tk_GetBitmapFromObj.3.gz.* 
    rm -f Tk_DefineBitmap.3.gz Tk_DefineBitmap.3.gz.* 
    rm -f Tk_NameOfBitmap.3.gz Tk_NameOfBitmap.3.gz.* 
    rm -f Tk_SizeOfBitmap.3.gz Tk_SizeOfBitmap.3.gz.* 
    rm -f Tk_FreeBitmapFromObj.3.gz Tk_FreeBitmapFromObj.3.gz.* 
    rm -f Tk_FreeBitmap.3.gz Tk_FreeBitmap.3.gz.* 
    ln -sf $S GetBitmap.3.gz$Z Tk_AllocBitmapFromObj.3.gz$Z 
    ln -sf $S GetBitmap.3.gz$Z Tk_GetBitmap.3.gz$Z 
    ln -sf $S GetBitmap.3.gz$Z Tk_GetBitmapFromObj.3.gz$Z 
    ln -sf $S GetBitmap.3.gz$Z Tk_DefineBitmap.3.gz$Z 
    ln -sf $S GetBitmap.3.gz$Z Tk_NameOfBitmap.3.gz$Z 
    ln -sf $S GetBitmap.3.gz$Z Tk_SizeOfBitmap.3.gz$Z 
    ln -sf $S GetBitmap.3.gz$Z Tk_FreeBitmapFromObj.3.gz$Z 
    ln -sf $S GetBitmap.3.gz$Z Tk_FreeBitmap.3.gz$Z 
fi
if test -r GetCapStyl.3.gz; then
    rm -f GetCapStyl.3.gz.*
    $ZIP GetCapStyl.3.gz
    rm -f Tk_GetCapStyle.3.gz Tk_GetCapStyle.3.gz.* 
    rm -f Tk_NameOfCapStyle.3.gz Tk_NameOfCapStyle.3.gz.* 
    ln -sf $S GetCapStyl.3.gz$Z Tk_GetCapStyle.3.gz$Z 
    ln -sf $S GetCapStyl.3.gz$Z Tk_NameOfCapStyle.3.gz$Z 
fi
if test -r GetClrmap.3.gz; then
    rm -f GetClrmap.3.gz.*
    $ZIP GetClrmap.3.gz
    rm -f Tk_GetColormap.3.gz Tk_GetColormap.3.gz.* 
    rm -f Tk_FreeColormap.3.gz Tk_FreeColormap.3.gz.* 
    ln -sf $S GetClrmap.3.gz$Z Tk_GetColormap.3.gz$Z 
    ln -sf $S GetClrmap.3.gz$Z Tk_FreeColormap.3.gz$Z 
fi
if test -r GetColor.3.gz; then
    rm -f GetColor.3.gz.*
    $ZIP GetColor.3.gz
    rm -f Tk_AllocColorFromObj.3.gz Tk_AllocColorFromObj.3.gz.* 
    rm -f Tk_GetColor.3.gz Tk_GetColor.3.gz.* 
    rm -f Tk_GetColorFromObj.3.gz Tk_GetColorFromObj.3.gz.* 
    rm -f Tk_GetColorByValue.3.gz Tk_GetColorByValue.3.gz.* 
    rm -f Tk_NameOfColor.3.gz Tk_NameOfColor.3.gz.* 
    rm -f Tk_FreeColorFromObj.3.gz Tk_FreeColorFromObj.3.gz.* 
    rm -f Tk_FreeColor.3.gz Tk_FreeColor.3.gz.* 
    ln -sf $S GetColor.3.gz$Z Tk_AllocColorFromObj.3.gz$Z 
    ln -sf $S GetColor.3.gz$Z Tk_GetColor.3.gz$Z 
    ln -sf $S GetColor.3.gz$Z Tk_GetColorFromObj.3.gz$Z 
    ln -sf $S GetColor.3.gz$Z Tk_GetColorByValue.3.gz$Z 
    ln -sf $S GetColor.3.gz$Z Tk_NameOfColor.3.gz$Z 
    ln -sf $S GetColor.3.gz$Z Tk_FreeColorFromObj.3.gz$Z 
    ln -sf $S GetColor.3.gz$Z Tk_FreeColor.3.gz$Z 
fi
if test -r GetCursor.3.gz; then
    rm -f GetCursor.3.gz.*
    $ZIP GetCursor.3.gz
    rm -f Tk_AllocCursorFromObj.3.gz Tk_AllocCursorFromObj.3.gz.* 
    rm -f Tk_GetCursor.3.gz Tk_GetCursor.3.gz.* 
    rm -f Tk_GetCursorFromObj.3.gz Tk_GetCursorFromObj.3.gz.* 
    rm -f Tk_GetCursorFromData.3.gz Tk_GetCursorFromData.3.gz.* 
    rm -f Tk_NameOfCursor.3.gz Tk_NameOfCursor.3.gz.* 
    rm -f Tk_FreeCursorFromObj.3.gz Tk_FreeCursorFromObj.3.gz.* 
    rm -f Tk_FreeCursor.3.gz Tk_FreeCursor.3.gz.* 
    ln -sf $S GetCursor.3.gz$Z Tk_AllocCursorFromObj.3.gz$Z 
    ln -sf $S GetCursor.3.gz$Z Tk_GetCursor.3.gz$Z 
    ln -sf $S GetCursor.3.gz$Z Tk_GetCursorFromObj.3.gz$Z 
    ln -sf $S GetCursor.3.gz$Z Tk_GetCursorFromData.3.gz$Z 
    ln -sf $S GetCursor.3.gz$Z Tk_NameOfCursor.3.gz$Z 
    ln -sf $S GetCursor.3.gz$Z Tk_FreeCursorFromObj.3.gz$Z 
    ln -sf $S GetCursor.3.gz$Z Tk_FreeCursor.3.gz$Z 
fi
if test -r GetDash.3.gz; then
    rm -f GetDash.3.gz.*
    $ZIP GetDash.3.gz
    rm -f Tk_GetDash.3.gz Tk_GetDash.3.gz.* 
    ln -sf $S GetDash.3.gz$Z Tk_GetDash.3.gz$Z 
fi
if test -r GetFont.3.gz; then
    rm -f GetFont.3.gz.*
    $ZIP GetFont.3.gz
    rm -f Tk_AllocFontFromObj.3.gz Tk_AllocFontFromObj.3.gz.* 
    rm -f Tk_GetFont.3.gz Tk_GetFont.3.gz.* 
    rm -f Tk_GetFontFromObj.3.gz Tk_GetFontFromObj.3.gz.* 
    rm -f Tk_NameOfFont.3.gz Tk_NameOfFont.3.gz.* 
    rm -f Tk_FreeFontFromObj.3.gz Tk_FreeFontFromObj.3.gz.* 
    rm -f Tk_FreeFont.3.gz Tk_FreeFont.3.gz.* 
    ln -sf $S GetFont.3.gz$Z Tk_AllocFontFromObj.3.gz$Z 
    ln -sf $S GetFont.3.gz$Z Tk_GetFont.3.gz$Z 
    ln -sf $S GetFont.3.gz$Z Tk_GetFontFromObj.3.gz$Z 
    ln -sf $S GetFont.3.gz$Z Tk_NameOfFont.3.gz$Z 
    ln -sf $S GetFont.3.gz$Z Tk_FreeFontFromObj.3.gz$Z 
    ln -sf $S GetFont.3.gz$Z Tk_FreeFont.3.gz$Z 
fi
if test -r GetGC.3.gz; then
    rm -f GetGC.3.gz.*
    $ZIP GetGC.3.gz
    rm -f Tk_GetGC.3.gz Tk_GetGC.3.gz.* 
    rm -f Tk_FreeGC.3.gz Tk_FreeGC.3.gz.* 
    ln -sf $S GetGC.3.gz$Z Tk_GetGC.3.gz$Z 
    ln -sf $S GetGC.3.gz$Z Tk_FreeGC.3.gz$Z 
fi
if test -r GetHINSTANCE.3.gz; then
    rm -f GetHINSTANCE.3.gz.*
    $ZIP GetHINSTANCE.3.gz
    rm -f Tk_GetHINSTANCE.3.gz Tk_GetHINSTANCE.3.gz.* 
    ln -sf $S GetHINSTANCE.3.gz$Z Tk_GetHINSTANCE.3.gz$Z 
fi
if test -r GetHWND.3.gz; then
    rm -f GetHWND.3.gz.*
    $ZIP GetHWND.3.gz
    rm -f Tk_GetHWND.3.gz Tk_GetHWND.3.gz.* 
    ln -sf $S GetHWND.3.gz$Z Tk_GetHWND.3.gz$Z 
fi
if test -r GetImage.3.gz; then
    rm -f GetImage.3.gz.*
    $ZIP GetImage.3.gz
    rm -f Tk_GetImage.3.gz Tk_GetImage.3.gz.* 
    rm -f Tk_RedrawImage.3.gz Tk_RedrawImage.3.gz.* 
    rm -f Tk_SizeOfImage.3.gz Tk_SizeOfImage.3.gz.* 
    rm -f Tk_FreeImage.3.gz Tk_FreeImage.3.gz.* 
    ln -sf $S GetImage.3.gz$Z Tk_GetImage.3.gz$Z 
    ln -sf $S GetImage.3.gz$Z Tk_RedrawImage.3.gz$Z 
    ln -sf $S GetImage.3.gz$Z Tk_SizeOfImage.3.gz$Z 
    ln -sf $S GetImage.3.gz$Z Tk_FreeImage.3.gz$Z 
fi
if test -r GetJoinStl.3.gz; then
    rm -f GetJoinStl.3.gz.*
    $ZIP GetJoinStl.3.gz
    rm -f Tk_GetJoinStyle.3.gz Tk_GetJoinStyle.3.gz.* 
    rm -f Tk_NameOfJoinStyle.3.gz Tk_NameOfJoinStyle.3.gz.* 
    ln -sf $S GetJoinStl.3.gz$Z Tk_GetJoinStyle.3.gz$Z 
    ln -sf $S GetJoinStl.3.gz$Z Tk_NameOfJoinStyle.3.gz$Z 
fi
if test -r GetJustify.3.gz; then
    rm -f GetJustify.3.gz.*
    $ZIP GetJustify.3.gz
    rm -f Tk_GetJustifyFromObj.3.gz Tk_GetJustifyFromObj.3.gz.* 
    rm -f Tk_GetJustify.3.gz Tk_GetJustify.3.gz.* 
    rm -f Tk_NameOfJustify.3.gz Tk_NameOfJustify.3.gz.* 
    ln -sf $S GetJustify.3.gz$Z Tk_GetJustifyFromObj.3.gz$Z 
    ln -sf $S GetJustify.3.gz$Z Tk_GetJustify.3.gz$Z 
    ln -sf $S GetJustify.3.gz$Z Tk_NameOfJustify.3.gz$Z 
fi
if test -r GetOption.3.gz; then
    rm -f GetOption.3.gz.*
    $ZIP GetOption.3.gz
    rm -f Tk_GetOption.3.gz Tk_GetOption.3.gz.* 
    ln -sf $S GetOption.3.gz$Z Tk_GetOption.3.gz$Z 
fi
if test -r GetPixels.3.gz; then
    rm -f GetPixels.3.gz.*
    $ZIP GetPixels.3.gz
    rm -f Tk_GetPixelsFromObj.3.gz Tk_GetPixelsFromObj.3.gz.* 
    rm -f Tk_GetPixels.3.gz Tk_GetPixels.3.gz.* 
    rm -f Tk_GetMMFromObj.3.gz Tk_GetMMFromObj.3.gz.* 
    rm -f Tk_GetScreenMM.3.gz Tk_GetScreenMM.3.gz.* 
    ln -sf $S GetPixels.3.gz$Z Tk_GetPixelsFromObj.3.gz$Z 
    ln -sf $S GetPixels.3.gz$Z Tk_GetPixels.3.gz$Z 
    ln -sf $S GetPixels.3.gz$Z Tk_GetMMFromObj.3.gz$Z 
    ln -sf $S GetPixels.3.gz$Z Tk_GetScreenMM.3.gz$Z 
fi
if test -r GetPixmap.3.gz; then
    rm -f GetPixmap.3.gz.*
    $ZIP GetPixmap.3.gz
    rm -f Tk_GetPixmap.3.gz Tk_GetPixmap.3.gz.* 
    rm -f Tk_FreePixmap.3.gz Tk_FreePixmap.3.gz.* 
    ln -sf $S GetPixmap.3.gz$Z Tk_GetPixmap.3.gz$Z 
    ln -sf $S GetPixmap.3.gz$Z Tk_FreePixmap.3.gz$Z 
fi
if test -r GetRelief.3.gz; then
    rm -f GetRelief.3.gz.*
    $ZIP GetRelief.3.gz
    rm -f Tk_GetReliefFromObj.3.gz Tk_GetReliefFromObj.3.gz.* 
    rm -f Tk_GetRelief.3.gz Tk_GetRelief.3.gz.* 
    rm -f Tk_NameOfRelief.3.gz Tk_NameOfRelief.3.gz.* 
    ln -sf $S GetRelief.3.gz$Z Tk_GetReliefFromObj.3.gz$Z 
    ln -sf $S GetRelief.3.gz$Z Tk_GetRelief.3.gz$Z 
    ln -sf $S GetRelief.3.gz$Z Tk_NameOfRelief.3.gz$Z 
fi
if test -r GetRootCrd.3.gz; then
    rm -f GetRootCrd.3.gz.*
    $ZIP GetRootCrd.3.gz
    rm -f Tk_GetRootCoords.3.gz Tk_GetRootCoords.3.gz.* 
    ln -sf $S GetRootCrd.3.gz$Z Tk_GetRootCoords.3.gz$Z 
fi
if test -r GetScroll.3.gz; then
    rm -f GetScroll.3.gz.*
    $ZIP GetScroll.3.gz
    rm -f Tk_GetScrollInfo.3.gz Tk_GetScrollInfo.3.gz.* 
    rm -f Tk_GetScrollInfoObj.3.gz Tk_GetScrollInfoObj.3.gz.* 
    ln -sf $S GetScroll.3.gz$Z Tk_GetScrollInfo.3.gz$Z 
    ln -sf $S GetScroll.3.gz$Z Tk_GetScrollInfoObj.3.gz$Z 
fi
if test -r GetSelect.3.gz; then
    rm -f GetSelect.3.gz.*
    $ZIP GetSelect.3.gz
    rm -f Tk_GetSelection.3.gz Tk_GetSelection.3.gz.* 
    ln -sf $S GetSelect.3.gz$Z Tk_GetSelection.3.gz$Z 
fi
if test -r GetUid.3.gz; then
    rm -f GetUid.3.gz.*
    $ZIP GetUid.3.gz
    rm -f Tk_GetUid.3.gz Tk_GetUid.3.gz.* 
    rm -f Tk_Uid.3.gz Tk_Uid.3.gz.* 
    ln -sf $S GetUid.3.gz$Z Tk_GetUid.3.gz$Z 
    ln -sf $S GetUid.3.gz$Z Tk_Uid.3.gz$Z 
fi
if test -r GetVRoot.3.gz; then
    rm -f GetVRoot.3.gz.*
    $ZIP GetVRoot.3.gz
    rm -f Tk_GetVRootGeometry.3.gz Tk_GetVRootGeometry.3.gz.* 
    ln -sf $S GetVRoot.3.gz$Z Tk_GetVRootGeometry.3.gz$Z 
fi
if test -r GetVisual.3.gz; then
    rm -f GetVisual.3.gz.*
    $ZIP GetVisual.3.gz
    rm -f Tk_GetVisual.3.gz Tk_GetVisual.3.gz.* 
    ln -sf $S GetVisual.3.gz$Z Tk_GetVisual.3.gz$Z 
fi
if test -r Grab.3.gz; then
    rm -f Grab.3.gz.*
    $ZIP Grab.3.gz
    rm -f Tk_Grab.3.gz Tk_Grab.3.gz.* 
    rm -f Tk_Ungrab.3.gz Tk_Ungrab.3.gz.* 
    ln -sf $S Grab.3.gz$Z Tk_Grab.3.gz$Z 
    ln -sf $S Grab.3.gz$Z Tk_Ungrab.3.gz$Z 
fi
if test -r HWNDToWindow.3.gz; then
    rm -f HWNDToWindow.3.gz.*
    $ZIP HWNDToWindow.3.gz
    rm -f Tk_HWNDToWindow.3.gz Tk_HWNDToWindow.3.gz.* 
    ln -sf $S HWNDToWindow.3.gz$Z Tk_HWNDToWindow.3.gz$Z 
fi
if test -r HandleEvent.3.gz; then
    rm -f HandleEvent.3.gz.*
    $ZIP HandleEvent.3.gz
    rm -f Tk_HandleEvent.3.gz Tk_HandleEvent.3.gz.* 
    ln -sf $S HandleEvent.3.gz$Z Tk_HandleEvent.3.gz$Z 
fi
if test -r IdToWindow.3.gz; then
    rm -f IdToWindow.3.gz.*
    $ZIP IdToWindow.3.gz
    rm -f Tk_IdToWindow.3.gz Tk_IdToWindow.3.gz.* 
    ln -sf $S IdToWindow.3.gz$Z Tk_IdToWindow.3.gz$Z 
fi
if test -r ImgChanged.3.gz; then
    rm -f ImgChanged.3.gz.*
    $ZIP ImgChanged.3.gz
    rm -f Tk_ImageChanged.3.gz Tk_ImageChanged.3.gz.* 
    ln -sf $S ImgChanged.3.gz$Z Tk_ImageChanged.3.gz$Z 
fi
if test -r InternAtom.3.gz; then
    rm -f InternAtom.3.gz.*
    $ZIP InternAtom.3.gz
    rm -f Tk_InternAtom.3.gz Tk_InternAtom.3.gz.* 
    rm -f Tk_GetAtomName.3.gz Tk_GetAtomName.3.gz.* 
    ln -sf $S InternAtom.3.gz$Z Tk_InternAtom.3.gz$Z 
    ln -sf $S InternAtom.3.gz$Z Tk_GetAtomName.3.gz$Z 
fi
if test -r MainLoop.3.gz; then
    rm -f MainLoop.3.gz.*
    $ZIP MainLoop.3.gz
    rm -f Tk_MainLoop.3.gz Tk_MainLoop.3.gz.* 
    ln -sf $S MainLoop.3.gz$Z Tk_MainLoop.3.gz$Z 
fi
if test -r MainWin.3.gz; then
    rm -f MainWin.3.gz.*
    $ZIP MainWin.3.gz
    rm -f Tk_MainWindow.3.gz Tk_MainWindow.3.gz.* 
    rm -f Tk_GetNumMainWindows.3.gz Tk_GetNumMainWindows.3.gz.* 
    ln -sf $S MainWin.3.gz$Z Tk_MainWindow.3.gz$Z 
    ln -sf $S MainWin.3.gz$Z Tk_GetNumMainWindows.3.gz$Z 
fi
if test -r MaintGeom.3.gz; then
    rm -f MaintGeom.3.gz.*
    $ZIP MaintGeom.3.gz
    rm -f Tk_MaintainGeometry.3.gz Tk_MaintainGeometry.3.gz.* 
    rm -f Tk_UnmaintainGeometry.3.gz Tk_UnmaintainGeometry.3.gz.* 
    ln -sf $S MaintGeom.3.gz$Z Tk_MaintainGeometry.3.gz$Z 
    ln -sf $S MaintGeom.3.gz$Z Tk_UnmaintainGeometry.3.gz$Z 
fi
if test -r ManageGeom.3.gz; then
    rm -f ManageGeom.3.gz.*
    $ZIP ManageGeom.3.gz
    rm -f Tk_ManageGeometry.3.gz Tk_ManageGeometry.3.gz.* 
    ln -sf $S ManageGeom.3.gz$Z Tk_ManageGeometry.3.gz$Z 
fi
if test -r MapWindow.3.gz; then
    rm -f MapWindow.3.gz.*
    $ZIP MapWindow.3.gz
    rm -f Tk_MapWindow.3.gz Tk_MapWindow.3.gz.* 
    rm -f Tk_UnmapWindow.3.gz Tk_UnmapWindow.3.gz.* 
    ln -sf $S MapWindow.3.gz$Z Tk_MapWindow.3.gz$Z 
    ln -sf $S MapWindow.3.gz$Z Tk_UnmapWindow.3.gz$Z 
fi
if test -r MeasureChar.3.gz; then
    rm -f MeasureChar.3.gz.*
    $ZIP MeasureChar.3.gz
    rm -f Tk_MeasureChars.3.gz Tk_MeasureChars.3.gz.* 
    rm -f Tk_TextWidth.3.gz Tk_TextWidth.3.gz.* 
    rm -f Tk_DrawChars.3.gz Tk_DrawChars.3.gz.* 
    rm -f Tk_UnderlineChars.3.gz Tk_UnderlineChars.3.gz.* 
    ln -sf $S MeasureChar.3.gz$Z Tk_MeasureChars.3.gz$Z 
    ln -sf $S MeasureChar.3.gz$Z Tk_TextWidth.3.gz$Z 
    ln -sf $S MeasureChar.3.gz$Z Tk_DrawChars.3.gz$Z 
    ln -sf $S MeasureChar.3.gz$Z Tk_UnderlineChars.3.gz$Z 
fi
if test -r MoveToplev.3.gz; then
    rm -f MoveToplev.3.gz.*
    $ZIP MoveToplev.3.gz
    rm -f Tk_MoveToplevelWindow.3.gz Tk_MoveToplevelWindow.3.gz.* 
    ln -sf $S MoveToplev.3.gz$Z Tk_MoveToplevelWindow.3.gz$Z 
fi
if test -r Name.3.gz; then
    rm -f Name.3.gz.*
    $ZIP Name.3.gz
    rm -f Tk_Name.3.gz Tk_Name.3.gz.* 
    rm -f Tk_PathName.3.gz Tk_PathName.3.gz.* 
    rm -f Tk_NameToWindow.3.gz Tk_NameToWindow.3.gz.* 
    ln -sf $S Name.3.gz$Z Tk_Name.3.gz$Z 
    ln -sf $S Name.3.gz$Z Tk_PathName.3.gz$Z 
    ln -sf $S Name.3.gz$Z Tk_NameToWindow.3.gz$Z 
fi
if test -r NameOfImg.3.gz; then
    rm -f NameOfImg.3.gz.*
    $ZIP NameOfImg.3.gz
    rm -f Tk_NameOfImage.3.gz Tk_NameOfImage.3.gz.* 
    ln -sf $S NameOfImg.3.gz$Z Tk_NameOfImage.3.gz$Z 
fi
if test -r OwnSelect.3.gz; then
    rm -f OwnSelect.3.gz.*
    $ZIP OwnSelect.3.gz
    rm -f Tk_OwnSelection.3.gz Tk_OwnSelection.3.gz.* 
    ln -sf $S OwnSelect.3.gz$Z Tk_OwnSelection.3.gz$Z 
fi
if test -r ParseArgv.3.gz; then
    rm -f ParseArgv.3.gz.*
    $ZIP ParseArgv.3.gz
    rm -f Tk_ParseArgv.3.gz Tk_ParseArgv.3.gz.* 
    ln -sf $S ParseArgv.3.gz$Z Tk_ParseArgv.3.gz$Z 
fi
if test -r QWinEvent.3.gz; then
    rm -f QWinEvent.3.gz.*
    $ZIP QWinEvent.3.gz
    rm -f Tk_CollapseMotionEvents.3.gz Tk_CollapseMotionEvents.3.gz.* 
    rm -f Tk_QueueWindowEvent.3.gz Tk_QueueWindowEvent.3.gz.* 
    ln -sf $S QWinEvent.3.gz$Z Tk_CollapseMotionEvents.3.gz$Z 
    ln -sf $S QWinEvent.3.gz$Z Tk_QueueWindowEvent.3.gz$Z 
fi
if test -r Restack.3.gz; then
    rm -f Restack.3.gz.*
    $ZIP Restack.3.gz
    rm -f Tk_RestackWindow.3.gz Tk_RestackWindow.3.gz.* 
    ln -sf $S Restack.3.gz$Z Tk_RestackWindow.3.gz$Z 
fi
if test -r RestrictEv.3.gz; then
    rm -f RestrictEv.3.gz.*
    $ZIP RestrictEv.3.gz
    rm -f Tk_RestrictEvents.3.gz Tk_RestrictEvents.3.gz.* 
    ln -sf $S RestrictEv.3.gz$Z Tk_RestrictEvents.3.gz$Z 
fi
if test -r SetAppName.3.gz; then
    rm -f SetAppName.3.gz.*
    $ZIP SetAppName.3.gz
    rm -f Tk_SetAppName.3.gz Tk_SetAppName.3.gz.* 
    ln -sf $S SetAppName.3.gz$Z Tk_SetAppName.3.gz$Z 
fi
if test -r SetCaret.3.gz; then
    rm -f SetCaret.3.gz.*
    $ZIP SetCaret.3.gz
    rm -f Tk_SetCaretPos.3.gz Tk_SetCaretPos.3.gz.* 
    ln -sf $S SetCaret.3.gz$Z Tk_SetCaretPos.3.gz$Z 
fi
if test -r SetClass.3.gz; then
    rm -f SetClass.3.gz.*
    $ZIP SetClass.3.gz
    rm -f Tk_SetClass.3.gz Tk_SetClass.3.gz.* 
    rm -f Tk_Class.3.gz Tk_Class.3.gz.* 
    ln -sf $S SetClass.3.gz$Z Tk_SetClass.3.gz$Z 
    ln -sf $S SetClass.3.gz$Z Tk_Class.3.gz$Z 
fi
if test -r SetClassProcs.3.gz; then
    rm -f SetClassProcs.3.gz.*
    $ZIP SetClassProcs.3.gz
    rm -f Tk_SetClassProcs.3.gz Tk_SetClassProcs.3.gz.* 
    ln -sf $S SetClassProcs.3.gz$Z Tk_SetClassProcs.3.gz$Z 
fi
if test -r SetGrid.3.gz; then
    rm -f SetGrid.3.gz.*
    $ZIP SetGrid.3.gz
    rm -f Tk_SetGrid.3.gz Tk_SetGrid.3.gz.* 
    rm -f Tk_UnsetGrid.3.gz Tk_UnsetGrid.3.gz.* 
    ln -sf $S SetGrid.3.gz$Z Tk_SetGrid.3.gz$Z 
    ln -sf $S SetGrid.3.gz$Z Tk_UnsetGrid.3.gz$Z 
fi
if test -r SetOptions.3.gz; then
    rm -f SetOptions.3.gz.*
    $ZIP SetOptions.3.gz
    rm -f Tk_CreateOptionTable.3.gz Tk_CreateOptionTable.3.gz.* 
    rm -f Tk_DeleteOptionTable.3.gz Tk_DeleteOptionTable.3.gz.* 
    rm -f Tk_InitOptions.3.gz Tk_InitOptions.3.gz.* 
    rm -f Tk_SetOptions.3.gz Tk_SetOptions.3.gz.* 
    rm -f Tk_FreeSavedOptions.3.gz Tk_FreeSavedOptions.3.gz.* 
    rm -f Tk_RestoreSavedOptions.3.gz Tk_RestoreSavedOptions.3.gz.* 
    rm -f Tk_GetOptionValue.3.gz Tk_GetOptionValue.3.gz.* 
    rm -f Tk_GetOptionInfo.3.gz Tk_GetOptionInfo.3.gz.* 
    rm -f Tk_FreeConfigOptions.3.gz Tk_FreeConfigOptions.3.gz.* 
    rm -f Tk_Offset.3.gz Tk_Offset.3.gz.* 
    ln -sf $S SetOptions.3.gz$Z Tk_CreateOptionTable.3.gz$Z 
    ln -sf $S SetOptions.3.gz$Z Tk_DeleteOptionTable.3.gz$Z 
    ln -sf $S SetOptions.3.gz$Z Tk_InitOptions.3.gz$Z 
    ln -sf $S SetOptions.3.gz$Z Tk_SetOptions.3.gz$Z 
    ln -sf $S SetOptions.3.gz$Z Tk_FreeSavedOptions.3.gz$Z 
    ln -sf $S SetOptions.3.gz$Z Tk_RestoreSavedOptions.3.gz$Z 
    ln -sf $S SetOptions.3.gz$Z Tk_GetOptionValue.3.gz$Z 
    ln -sf $S SetOptions.3.gz$Z Tk_GetOptionInfo.3.gz$Z 
    ln -sf $S SetOptions.3.gz$Z Tk_FreeConfigOptions.3.gz$Z 
    ln -sf $S SetOptions.3.gz$Z Tk_Offset.3.gz$Z 
fi
if test -r SetVisual.3.gz; then
    rm -f SetVisual.3.gz.*
    $ZIP SetVisual.3.gz
    rm -f Tk_SetWindowVisual.3.gz Tk_SetWindowVisual.3.gz.* 
    ln -sf $S SetVisual.3.gz$Z Tk_SetWindowVisual.3.gz$Z 
fi
if test -r StrictMotif.3.gz; then
    rm -f StrictMotif.3.gz.*
    $ZIP StrictMotif.3.gz
    rm -f Tk_StrictMotif.3.gz Tk_StrictMotif.3.gz.* 
    ln -sf $S StrictMotif.3.gz$Z Tk_StrictMotif.3.gz$Z 
fi
if test -r TextLayout.3.gz; then
    rm -f TextLayout.3.gz.*
    $ZIP TextLayout.3.gz
    rm -f Tk_ComputeTextLayout.3.gz Tk_ComputeTextLayout.3.gz.* 
    rm -f Tk_FreeTextLayout.3.gz Tk_FreeTextLayout.3.gz.* 
    rm -f Tk_DrawTextLayout.3.gz Tk_DrawTextLayout.3.gz.* 
    rm -f Tk_UnderlineTextLayout.3.gz Tk_UnderlineTextLayout.3.gz.* 
    rm -f Tk_PointToChar.3.gz Tk_PointToChar.3.gz.* 
    rm -f Tk_CharBbox.3.gz Tk_CharBbox.3.gz.* 
    rm -f Tk_DistanceToTextLayout.3.gz Tk_DistanceToTextLayout.3.gz.* 
    rm -f Tk_IntersectTextLayout.3.gz Tk_IntersectTextLayout.3.gz.* 
    rm -f Tk_TextLayoutToPostscript.3.gz Tk_TextLayoutToPostscript.3.gz.* 
    ln -sf $S TextLayout.3.gz$Z Tk_ComputeTextLayout.3.gz$Z 
    ln -sf $S TextLayout.3.gz$Z Tk_FreeTextLayout.3.gz$Z 
    ln -sf $S TextLayout.3.gz$Z Tk_DrawTextLayout.3.gz$Z 
    ln -sf $S TextLayout.3.gz$Z Tk_UnderlineTextLayout.3.gz$Z 
    ln -sf $S TextLayout.3.gz$Z Tk_PointToChar.3.gz$Z 
    ln -sf $S TextLayout.3.gz$Z Tk_CharBbox.3.gz$Z 
    ln -sf $S TextLayout.3.gz$Z Tk_DistanceToTextLayout.3.gz$Z 
    ln -sf $S TextLayout.3.gz$Z Tk_IntersectTextLayout.3.gz$Z 
    ln -sf $S TextLayout.3.gz$Z Tk_TextLayoutToPostscript.3.gz$Z 
fi
if test -r TkInitStubs.3.gz; then
    rm -f TkInitStubs.3.gz.*
    $ZIP TkInitStubs.3.gz
    rm -f Tk_InitStubs.3.gz Tk_InitStubs.3.gz.* 
    ln -sf $S TkInitStubs.3.gz$Z Tk_InitStubs.3.gz$Z 
fi
if test -r Tk_Init.3.gz; then
    rm -f Tk_Init.3.gz.*
    $ZIP Tk_Init.3.gz
    rm -f Tk_SafeInit.3.gz Tk_SafeInit.3.gz.* 
    ln -sf $S Tk_Init.3.gz$Z Tk_SafeInit.3.gz$Z 
fi
if test -r Tk_Main.3.gz; then
    rm -f Tk_Main.3.gz.*
    $ZIP Tk_Main.3.gz
fi
if test -r WindowId.3.gz; then
    rm -f WindowId.3.gz.*
    $ZIP WindowId.3.gz
    rm -f Tk_WindowId.3.gz Tk_WindowId.3.gz.* 
    rm -f Tk_Parent.3.gz Tk_Parent.3.gz.* 
    rm -f Tk_Display.3.gz Tk_Display.3.gz.* 
    rm -f Tk_DisplayName.3.gz Tk_DisplayName.3.gz.* 
    rm -f Tk_ScreenNumber.3.gz Tk_ScreenNumber.3.gz.* 
    rm -f Tk_Screen.3.gz Tk_Screen.3.gz.* 
    rm -f Tk_X.3.gz Tk_X.3.gz.* 
    rm -f Tk_Y.3.gz Tk_Y.3.gz.* 
    rm -f Tk_Width.3.gz Tk_Width.3.gz.* 
    rm -f Tk_Height.3.gz Tk_Height.3.gz.* 
    rm -f Tk_Changes.3.gz Tk_Changes.3.gz.* 
    rm -f Tk_Attributes.3.gz Tk_Attributes.3.gz.* 
    rm -f Tk_IsContainer.3.gz Tk_IsContainer.3.gz.* 
    rm -f Tk_IsEmbedded.3.gz Tk_IsEmbedded.3.gz.* 
    rm -f Tk_IsMapped.3.gz Tk_IsMapped.3.gz.* 
    rm -f Tk_IsTopLevel.3.gz Tk_IsTopLevel.3.gz.* 
    rm -f Tk_ReqWidth.3.gz Tk_ReqWidth.3.gz.* 
    rm -f Tk_ReqHeight.3.gz Tk_ReqHeight.3.gz.* 
    rm -f Tk_MinReqWidth.3.gz Tk_MinReqWidth.3.gz.* 
    rm -f Tk_MinReqHeight.3.gz Tk_MinReqHeight.3.gz.* 
    rm -f Tk_InternalBorderLeft.3.gz Tk_InternalBorderLeft.3.gz.* 
    rm -f Tk_InternalBorderRight.3.gz Tk_InternalBorderRight.3.gz.* 
    rm -f Tk_InternalBorderTop.3.gz Tk_InternalBorderTop.3.gz.* 
    rm -f Tk_InternalBorderBottom.3.gz Tk_InternalBorderBottom.3.gz.* 
    rm -f Tk_Visual.3.gz Tk_Visual.3.gz.* 
    rm -f Tk_Depth.3.gz Tk_Depth.3.gz.* 
    rm -f Tk_Colormap.3.gz Tk_Colormap.3.gz.* 
    ln -sf $S WindowId.3.gz$Z Tk_WindowId.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_Parent.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_Display.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_DisplayName.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_ScreenNumber.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_Screen.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_X.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_Y.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_Width.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_Height.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_Changes.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_Attributes.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_IsContainer.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_IsEmbedded.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_IsMapped.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_IsTopLevel.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_ReqWidth.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_ReqHeight.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_MinReqWidth.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_MinReqHeight.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_InternalBorderLeft.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_InternalBorderRight.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_InternalBorderTop.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_InternalBorderBottom.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_Visual.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_Depth.3.gz$Z 
    ln -sf $S WindowId.3.gz$Z Tk_Colormap.3.gz$Z 
fi
if test -r bell.n.gz; then
    rm -f bell.n.gz.*
    $ZIP bell.n.gz
fi
if test -r bind.n.gz; then
    rm -f bind.n.gz.*
    $ZIP bind.n.gz
fi
if test -r bindtags.n.gz; then
    rm -f bindtags.n.gz.*
    $ZIP bindtags.n.gz
fi
if test -r bitmap.n.gz; then
    rm -f bitmap.n.gz.*
    $ZIP bitmap.n.gz
fi
if test -r button.n.gz; then
    rm -f button.n.gz.*
    $ZIP button.n.gz
fi
if test -r canvas.n.gz; then
    rm -f canvas.n.gz.*
    $ZIP canvas.n.gz
fi
if test -r checkbutton.n.gz; then
    rm -f checkbutton.n.gz.*
    $ZIP checkbutton.n.gz
fi
if test -r chooseColor.n.gz; then
    rm -f chooseColor.n.gz.*
    $ZIP chooseColor.n.gz
    rm -f tk_chooseColor.n.gz tk_chooseColor.n.gz.* 
    ln -sf $S chooseColor.n.gz$Z tk_chooseColor.n.gz$Z 
fi
if test -r chooseDirectory.n.gz; then
    rm -f chooseDirectory.n.gz.*
    $ZIP chooseDirectory.n.gz
    rm -f tk_chooseDirectory.n.gz tk_chooseDirectory.n.gz.* 
    ln -sf $S chooseDirectory.n.gz$Z tk_chooseDirectory.n.gz$Z 
fi
if test -r clipboard.n.gz; then
    rm -f clipboard.n.gz.*
    $ZIP clipboard.n.gz
fi
if test -r colors.n.gz; then
    rm -f colors.n.gz.*
    $ZIP colors.n.gz
fi
if test -r console.n.gz; then
    rm -f console.n.gz.*
    $ZIP console.n.gz
fi
if test -r cursors.n.gz; then
    rm -f cursors.n.gz.*
    $ZIP cursors.n.gz
fi
if test -r destroy.n.gz; then
    rm -f destroy.n.gz.*
    $ZIP destroy.n.gz
fi
if test -r dialog.n.gz; then
    rm -f dialog.n.gz.*
    $ZIP dialog.n.gz
    rm -f tk_dialog.n.gz tk_dialog.n.gz.* 
    ln -sf $S dialog.n.gz$Z tk_dialog.n.gz$Z 
fi
if test -r entry.n.gz; then
    rm -f entry.n.gz.*
    $ZIP entry.n.gz
fi
if test -r event.n.gz; then
    rm -f event.n.gz.*
    $ZIP event.n.gz
fi
if test -r focus.n.gz; then
    rm -f focus.n.gz.*
    $ZIP focus.n.gz
fi
if test -r focusNext.n.gz; then
    rm -f focusNext.n.gz.*
    $ZIP focusNext.n.gz
    rm -f tk_focusNext.n.gz tk_focusNext.n.gz.* 
    rm -f tk_focusPrev.n.gz tk_focusPrev.n.gz.* 
    rm -f tk_focusFollowsMouse.n.gz tk_focusFollowsMouse.n.gz.* 
    ln -sf $S focusNext.n.gz$Z tk_focusNext.n.gz$Z 
    ln -sf $S focusNext.n.gz$Z tk_focusPrev.n.gz$Z 
    ln -sf $S focusNext.n.gz$Z tk_focusFollowsMouse.n.gz$Z 
fi
if test -r font.n.gz; then
    rm -f font.n.gz.*
    $ZIP font.n.gz
fi
if test -r frame.n.gz; then
    rm -f frame.n.gz.*
    $ZIP frame.n.gz
fi
if test -r getOpenFile.n.gz; then
    rm -f getOpenFile.n.gz.*
    $ZIP getOpenFile.n.gz
    rm -f tk_getOpenFile.n.gz tk_getOpenFile.n.gz.* 
    rm -f tk_getSaveFile.n.gz tk_getSaveFile.n.gz.* 
    ln -sf $S getOpenFile.n.gz$Z tk_getOpenFile.n.gz$Z 
    ln -sf $S getOpenFile.n.gz$Z tk_getSaveFile.n.gz$Z 
fi
if test -r grab.n.gz; then
    rm -f grab.n.gz.*
    $ZIP grab.n.gz
fi
if test -r grid.n.gz; then
    rm -f grid.n.gz.*
    $ZIP grid.n.gz
fi
if test -r image.n.gz; then
    rm -f image.n.gz.*
    $ZIP image.n.gz
fi
if test -r keysyms.n.gz; then
    rm -f keysyms.n.gz.*
    $ZIP keysyms.n.gz
fi
if test -r label.n.gz; then
    rm -f label.n.gz.*
    $ZIP label.n.gz
fi
if test -r labelframe.n.gz; then
    rm -f labelframe.n.gz.*
    $ZIP labelframe.n.gz
fi
if test -r listbox.n.gz; then
    rm -f listbox.n.gz.*
    $ZIP listbox.n.gz
fi
if test -r loadTk.n.gz; then
    rm -f loadTk.n.gz.*
    $ZIP loadTk.n.gz
fi
if test -r lower.n.gz; then
    rm -f lower.n.gz.*
    $ZIP lower.n.gz
fi
if test -r menu.n.gz; then
    rm -f menu.n.gz.*
    $ZIP menu.n.gz
    rm -f tk_menuSetFocus.n.gz tk_menuSetFocus.n.gz.* 
    ln -sf $S menu.n.gz$Z tk_menuSetFocus.n.gz$Z 
fi
if test -r menubar.n.gz; then
    rm -f menubar.n.gz.*
    $ZIP menubar.n.gz
    rm -f tk_menuBar.n.gz tk_menuBar.n.gz.* 
    rm -f tk_bindForTraversal.n.gz tk_bindForTraversal.n.gz.* 
    ln -sf $S menubar.n.gz$Z tk_menuBar.n.gz$Z 
    ln -sf $S menubar.n.gz$Z tk_bindForTraversal.n.gz$Z 
fi
if test -r menubutton.n.gz; then
    rm -f menubutton.n.gz.*
    $ZIP menubutton.n.gz
fi
if test -r message.n.gz; then
    rm -f message.n.gz.*
    $ZIP message.n.gz
fi
if test -r messageBox.n.gz; then
    rm -f messageBox.n.gz.*
    $ZIP messageBox.n.gz
    rm -f tk_messageBox.n.gz tk_messageBox.n.gz.* 
    ln -sf $S messageBox.n.gz$Z tk_messageBox.n.gz$Z 
fi
if test -r option.n.gz; then
    rm -f option.n.gz.*
    $ZIP option.n.gz
fi
if test -r optionMenu.n.gz; then
    rm -f optionMenu.n.gz.*
    $ZIP optionMenu.n.gz
    rm -f tk_optionMenu.n.gz tk_optionMenu.n.gz.* 
    ln -sf $S optionMenu.n.gz$Z tk_optionMenu.n.gz$Z 
fi
if test -r options.n.gz; then
    rm -f options.n.gz.*
    $ZIP options.n.gz
fi
if test -r pack-old.n.gz; then
    rm -f pack-old.n.gz.*
    $ZIP pack-old.n.gz
fi
if test -r pack.n.gz; then
    rm -f pack.n.gz.*
    $ZIP pack.n.gz
fi
if test -r palette.n.gz; then
    rm -f palette.n.gz.*
    $ZIP palette.n.gz
    rm -f tk_setPalette.n.gz tk_setPalette.n.gz.* 
    rm -f tk_bisque.n.gz tk_bisque.n.gz.* 
    ln -sf $S palette.n.gz$Z tk_setPalette.n.gz$Z 
    ln -sf $S palette.n.gz$Z tk_bisque.n.gz$Z 
fi
if test -r panedwindow.n.gz; then
    rm -f panedwindow.n.gz.*
    $ZIP panedwindow.n.gz
fi
if test -r photo.n.gz; then
    rm -f photo.n.gz.*
    $ZIP photo.n.gz
fi
if test -r place.n.gz; then
    rm -f place.n.gz.*
    $ZIP place.n.gz
fi
if test -r popup.n.gz; then
    rm -f popup.n.gz.*
    $ZIP popup.n.gz
    rm -f tk_popup.n.gz tk_popup.n.gz.* 
    ln -sf $S popup.n.gz$Z tk_popup.n.gz$Z 
fi
if test -r radiobutton.n.gz; then
    rm -f radiobutton.n.gz.*
    $ZIP radiobutton.n.gz
fi
if test -r raise.n.gz; then
    rm -f raise.n.gz.*
    $ZIP raise.n.gz
fi
if test -r scale.n.gz; then
    rm -f scale.n.gz.*
    $ZIP scale.n.gz
fi
if test -r scrollbar.n.gz; then
    rm -f scrollbar.n.gz.*
    $ZIP scrollbar.n.gz
fi
if test -r selection.n.gz; then
    rm -f selection.n.gz.*
    $ZIP selection.n.gz
fi
if test -r send.n.gz; then
    rm -f send.n.gz.*
    $ZIP send.n.gz
fi
if test -r spinbox.n.gz; then
    rm -f spinbox.n.gz.*
    $ZIP spinbox.n.gz
fi
if test -r text.n.gz; then
    rm -f text.n.gz.*
    $ZIP text.n.gz
    rm -f tk_textCopy.n.gz tk_textCopy.n.gz.* 
    rm -f tk_textCut.n.gz tk_textCut.n.gz.* 
    rm -f tk_textPaste.n.gz tk_textPaste.n.gz.* 
    ln -sf $S text.n.gz$Z tk_textCopy.n.gz$Z 
    ln -sf $S text.n.gz$Z tk_textCut.n.gz$Z 
    ln -sf $S text.n.gz$Z tk_textPaste.n.gz$Z 
fi
if test -r tk.n.gz; then
    rm -f tk.n.gz.*
    $ZIP tk.n.gz
fi
if test -r tkerror.n.gz; then
    rm -f tkerror.n.gz.*
    $ZIP tkerror.n.gz
fi
if test -r tkvars.n.gz; then
    rm -f tkvars.n.gz.*
    $ZIP tkvars.n.gz
fi
if test -r tkwait.n.gz; then
    rm -f tkwait.n.gz.*
    $ZIP tkwait.n.gz
fi
if test -r toplevel.n.gz; then
    rm -f toplevel.n.gz.*
    $ZIP toplevel.n.gz
fi
if test -r winfo.n.gz; then
    rm -f winfo.n.gz.*
    $ZIP winfo.n.gz
fi
if test -r wish.1; then
    rm -f wish.1.*
    $ZIP wish.1
fi
if test -r wm.n.gz; then
    rm -f wm.n.gz.*
    $ZIP wm.n.gz
fi
exit 0
