package org.hd.source.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hd.source.entity.Source;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SourceDto {
    private Source source;
    private String downloadInfo;
}
