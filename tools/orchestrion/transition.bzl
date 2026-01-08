"""Configuration transition to enable orchestrion in rules_go child configs."""

def _orch_transition_impl(_settings, _attr):
    return {
        "@rules_go//go/private/orchestrion:enabled": True,
    }

orch_transition = transition(
    implementation = _orch_transition_impl,
    inputs = [],
    outputs = [
        "@rules_go//go/private/orchestrion:enabled",
    ],
)
