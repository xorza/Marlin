# Created by xxorza

from ..Script import Script


class ProgressWriter(Script): #Script
    def __init__(self):
        super().__init__()

    def getSettingDataString(self):
        return """{
            "name": "Progress writer",
            "key": "ProgressWriter",
            "metadata": {},
            "version": 2,
            "settings":
            {
               
            }
        }"""

    def findValueInLayer(self, value , layer):
        time_line = next((line for line in layer.split("\n") if value in line), None)
        if time_line is None:
             return None

        time = str(time_line[len(value):])
        return float(time)

    def execute(self, data):
        for layer in (data):
            max_time = self.findValueInLayer(";TIME:",layer)
            if max_time is not None:
                break

        for idx,layer in enumerate(data):
             layer_time = self.findValueInLayer(";TIME_ELAPSED:",layer)
             if layer_time is None:
                continue
             progress = int(100 * layer_time / max_time)
             layer += "M73 P" + str(progress) + "\n\n"
             data[idx] = layer

        return data
        