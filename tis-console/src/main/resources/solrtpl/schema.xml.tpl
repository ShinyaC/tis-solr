<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE schema SYSTEM "solrres://tisrepository/dtd/solrschema.dtd">
<schema name="template" version="1.5">
  <types>
    <fieldType name="string" class="solr.StrField" sortMissingLast="true" omitNorms="true" omitTermFreqAndPositions="true" />
    <fieldType name="int" class="solr.IntPointField" docValues="false" />
    <fieldType name="float" class="solr.FloatPointField" docValues="false" />
    <fieldType name="long" class="solr.LongPointField" docValues="false" />
    <fieldType name="double" class="solr.DoublePointField" docValues="false" />

	<fieldType name="bitwise" class="com.qlangtech.tis.solrextend.fieldtype.BitwiseField"   omitNorms="true"  omitTermFreqAndPositions="true" />

    <fieldType name="ik" class="solr.TextField" autoGeneratePhraseQueries="false" omitNorms="true" omitTermFreqAndPositions="false">
      <analyzer type="query">
        <tokenizer class="com.qlangtech.tis.solrextend.fieldtype.st.STConvertTokenizerFactory" />
        <filter class="com.qlangtech.tis.solrextend.analyzer.IKTokenFilterFactory" />
        <filter class="solr.LowerCaseFilterFactory" />
        <filter class="solr.TrimFilterFactory" />
      </analyzer>
      <analyzer type="index">
        <tokenizer class="com.qlangtech.tis.solrextend.fieldtype.st.STConvertTokenizerFactory" />
        <filter class="com.qlangtech.tis.solrextend.analyzer.IKTokenFilterFactory" />
      </analyzer>
    </fieldType>
    <fieldType name="text_ws" class="solr.TextField" sortMissingLast="true" omitNorms="true" autoGeneratePhraseQueries="false" omitTermFreqAndPositions="true">
      <analyzer>
        <tokenizer class="solr.WhitespaceTokenizerFactory" />
      </analyzer>
    </fieldType>
    <fieldType name="like" class="solr.TextField" sortMissingLast="true" omitNorms="true" autoGeneratePhraseQueries="false" omitTermFreqAndPositions="true">
      <analyzer type="index">
        <tokenizer class="solr.NGramTokenizerFactory" minGramSize="2" maxGramSize="5" />
        <filter class="solr.LowerCaseFilterFactory" />
      </analyzer>
      <analyzer type="query">
        <tokenizer class="solr.WhitespaceTokenizerFactory" />
        <filter class="solr.LowerCaseFilterFactory" />
      </analyzer>
    </fieldType>
    <fieldType name="pinyin" class="solr.TextField" positionIncrementGap="100" autoGeneratePhraseQueries="false" omitNorms="true" omitPositions="true">
      <analyzer type="index">
        <tokenizer class="solr.PatternTokenizerFactory" pattern=",\s*" />
        <filter class="solr.NGramFilterFactory" minGramSize="1" maxGramSize="7" />
        <filter class="solr.LowerCaseFilterFactory" />
        <filter class="solr.TrimFilterFactory" />
        <filter class="com.qlangtech.tis.solrextend.fieldtype.pinyin.PinyinTokenFilterFactory" />
      </analyzer>
      <analyzer type="query">
        <tokenizer class="solr.PatternTokenizerFactory" pattern=",\s*" />
        <filter class="solr.LowerCaseFilterFactory" />
      </analyzer>
    </fieldType>
  </types>
  <fields>
    <field name="id" type="string" stored="true" indexed="true" docValues="false" multiValued="false" />
    <field name="_version_" type="long" stored="true" indexed="false" docValues="true" multiValued="false" />
    <field name="text" type="string" stored="false" indexed="true" docValues="false" multiValued="true" />
  </fields>
  <uniqueKey>id</uniqueKey>
  <sharedKey>id</sharedKey>
</schema>
