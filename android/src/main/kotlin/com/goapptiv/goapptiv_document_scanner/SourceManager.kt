package com.goapptiv.goapptiv_document_scanner


import com.goapptiv.goapptiv_document_scanner.processor.Corners
import org.opencv.core.Mat

class SourceManager {
    companion object {
        var pic: Mat? = null
        var corners: Corners? = null
    }
}
