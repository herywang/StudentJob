package cn.mdx.pojo;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.ArrayList;
@EqualsAndHashCode(callSuper = true)
@Data
public class DetailDiary extends WDiary {
    private ArrayList<String> images;
}
