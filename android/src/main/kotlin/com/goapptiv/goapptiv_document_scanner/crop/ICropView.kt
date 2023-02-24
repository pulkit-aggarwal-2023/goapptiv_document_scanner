package com.goapptiv.goapptiv_document_scanner.crop

import android.widget.ImageView
import com.goapptiv.goapptiv_document_scanner.view.PaperRectangle



class ICropView {
    interface Proxy {
        fun getPaper(): ImageView
        fun getPaperRect(): PaperRectangle
        fun getCroppedPaper(): ImageView
    }
}
