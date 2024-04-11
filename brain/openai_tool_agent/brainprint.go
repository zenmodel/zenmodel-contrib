package openai_tool_agent

import (
	"github.com/sashabaranov/go-openai"
	"github.com/zenmodel/zenmodel"
	"github.com/zenmodel/zenmodel-contrib/processor/calltools"
	"github.com/zenmodel/zenmodel-contrib/processor/openaichat"
	"github.com/zenmodel/zenmodel-contrib/tools"
)

func CloneBrainprint(toolCallDefines ...tools.ToolCallDefinition) *zenmodel.Brainprint {
	bp := zenmodel.NewBrainPrint()
	// add neuron
	bp.AddNeuronWithProcessor("llm", openaichat.NewProcessor().WithToolCallDefinitions(toolCallDefines))
	bp.AddNeuronWithProcessor("action", calltools.NewProcessor().WithToolCallDefinitions(toolCallDefines))

	// add entry link
	_, _ = bp.AddEntryLink("llm")

	// add link
	continueLink, _ := bp.AddLink("llm", "action")
	_, _ = bp.AddLink("action", "llm")

	// add end link
	endLink, _ := bp.AddEndLink("llm")

	// add link to cast group of a neuron
	_ = bp.AddLinkToCastGroup("llm", "continue", continueLink)
	_ = bp.AddLinkToCastGroup("llm", "end", endLink)
	// bind cast group select function for neuron
	_ = bp.BindCastGroupSelectFunc("llm", llmNext)

	return bp
}

func llmNext(b zenmodel.BrainRuntime) string {
	if !b.ExistMemory("messages") {
		return "end"
	}
	messages, _ := b.GetMemory("messages").([]openai.ChatCompletionMessage)
	lastMsg := messages[len(messages)-1]
	if len(lastMsg.ToolCalls) == 0 { // no need to call any tools
		return "end"
	}

	return "continue"
}
