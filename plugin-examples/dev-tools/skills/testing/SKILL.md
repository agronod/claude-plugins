---
description: Generate comprehensive tests for code, including unit tests, integration tests, and edge cases
---

# Testing Skill

Use this skill when asked to write tests or when generating tests would be helpful.

## Capabilities

- Generate unit tests for functions and classes
- Create integration tests for APIs and services
- Identify edge cases and boundary conditions
- Set up test fixtures and mocks
- Follow project's existing test patterns

## Test Generation Process

1. **Analyze the Code**
   - Identify the function/class to test
   - Understand inputs, outputs, and side effects
   - Note dependencies that may need mocking

2. **Identify Test Cases**
   - Happy path scenarios
   - Edge cases (empty inputs, null values, boundaries)
   - Error conditions and exception handling
   - Concurrent/async behavior if applicable

3. **Follow Project Conventions**
   - Use the same test framework (Jest, pytest, etc.)
   - Match existing test file structure
   - Follow naming conventions
   - Use existing test utilities/helpers

4. **Write Quality Tests**
   - One assertion concept per test
   - Descriptive test names (describe what, not how)
   - Arrange-Act-Assert pattern
   - Clean up resources in teardown

## Example Test Structure

```javascript
describe('FunctionName', () => {
  describe('when given valid input', () => {
    it('should return expected output', () => {
      // Arrange
      const input = createTestInput();

      // Act
      const result = functionName(input);

      // Assert
      expect(result).toEqual(expectedOutput);
    });
  });

  describe('when given invalid input', () => {
    it('should throw ValidationError', () => {
      expect(() => functionName(null)).toThrow(ValidationError);
    });
  });
});
```

## Supported Frameworks

- JavaScript/TypeScript: Jest, Vitest, Mocha
- Python: pytest, unittest
- Go: testing package
- Rust: built-in test framework
- Java: JUnit, TestNG
